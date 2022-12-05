class Api::V1::LikesController < ApplicationController

  def create
    @author = Author.find(params[:author_id])
    @like = @author.likes.new(like_params)
    @like.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @author = Author.find(params[:author_id])
    @like = @author.likes.find(params[:id])
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end

end
