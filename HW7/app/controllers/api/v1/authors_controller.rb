class Api::V1::AuthorsController < ApplicationController
  #before_action :set_author, only: %i[show, destroy]

  def index
    @authors = Author.all
    render json: { data: @authors }, status: :ok
  end

  def show
    @author = Author.find(params[:id])
    render json: { data: @author }, status: :ok
  end

  def create
    @author = Author.create
    render json: { data: @author }, status: :ok
  end

  def destroy
    @author = Author.find(params[:id])
    if @author.destroy!
      render json: { status: "Delete" }, status: :ok
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

#   private
#
#   def set_author
#     @author = Author.find(params[:id])
#   end
#
#   def author_params
#     params.permit(:name)
#   end
end
