class CommentsController < ApplicationController
  def index
    # @artworks = Artwork.all
    # render json: @artworks
    # debugger
    if params[:user_id]
      @comments = Comment.where(user_id: params[:user_id])
    elsif params[:artwork_id]
      @comments = Comment.where(artwork_id: params[:artwork_id])
    else
      render json: { error: 'The comment does not exist' }, status: 404
      return
    end

    render json: @comments
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: 422
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    render json: @comment
  end
  
  private

  def comment_params
    params.require(:comment).permit(:body, :artwork_id, :user_id)
  end
end
