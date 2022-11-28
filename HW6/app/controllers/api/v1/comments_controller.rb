class Api::V1::CommentsController < ApplicationController
  before_action :set_article
  before_action :set_comment, only: %i[show update destroy]

  def index
    if @article.comments.statuses.keys.include?(params[:status])
      @comment_status = @article.comments.with_status(params[:status])
      render json: @comment_status
    else
      render json: @article.comments.all
    end
  end

  def show
    render json: @comment, status: :ok
  end

  def create
    @article = Article.find_by_id(params[:article_id])
    @article_comment = @article.comments.create(comment_params[:body])
    @article_comment.author_id = Author.find_by_id(params[:author_id]).id
    @article_comment.save
    render json: @article_comment, status: :created
  end

  def update
    if @comment.update(status_params)
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @comment.destroy
      render json: { status: "Delete" }, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def set_article
    @article = Article.find_by_id(params[:article_id])
    # rescue ActiveRecord::RecordNotFound => e
    #   logger.info e
    #   return render json: { message: 'resource id not found' }, status: :not_found
  end

  def set_comment
    @comment = Comment.find_by_id(params[:id])
    # rescue ActiveRecord::RecordNotFound => e
    #   logger.info e
    #   return render json: { message: 'resource id not found' }, status: :not_found
  end

  def comment_params
    params.require(:authors).require(:comments).permit(:body)
  end

  def status_params
    params.require(:articles).require(:comments).permit(:status)
  end
end