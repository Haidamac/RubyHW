class Api::V1::CommentsController < ApplicationController
  before_action :set_author
  before_action :set_article
  before_action :set_comment, only: %i[show update destroy]

   def index
     if status_params.presence
       if status_params[:status] == '1'
         render json: @article.comments.published_only
       else
         render json: @article.comments.unpublished_only
       end
     else
       render json: @article.comments.all_comments
     end
   end

  def show
    render json: @comment, status: :ok
  end

  def create
    @comment = @article.comments.new(comment_params)
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors
    end
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

  def set_author
    @author = Author.find_by_id(params[:author_id])
    rescue ActiveRecord::RecordNotFound => e
      logger.info e
      return render json: { message: 'resource id not found' }, status: :not_found
  end

  def set_article
    @article = Article.find_by_id(params[:article_id])
    rescue ActiveRecord::RecordNotFound => e
      logger.info e
      return render json: { message: 'resource id not found' }, status: :not_found
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      logger.info e
      return render json: { message: 'resource id not found' }, status: :not_found
  end

  def comment_params
    params.require(:comment).permit(:body, :author_id)
  end

  def status_params
    params.permit(:status)
    # params.require(:comment).permit(:status)
    # sp[:status] = params[:status].to_i
    # return sp
  end

end