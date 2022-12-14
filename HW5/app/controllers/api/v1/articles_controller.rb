class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[show update destroy]

  # GET /api/v1/articles
  def index
    @articles = Article.all

    if @articles
      render json: { data: @articles }, status: :ok
    else
      render json: @articles.errors, status: :bad_request
    end
  end

  # GET /api/v1/articles/1
  def show
    render json: { data: @article }, status: :ok
  end

  # POST /api/v1/articles
  def create
    @article = Article.new(article_params)

    if @article.save
      render json: { status: 'Created', data: @article }, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/articles/1
  def update
    if @article.update(article_params)
      render json: { status: 'Update', data: @article }, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/articles/1
  def destroy
    if @article.destroy!
      render json: { status: 'Delete' }, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        logger.info e
        return render json: { message: 'article id not found' }, status: :not_found
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
