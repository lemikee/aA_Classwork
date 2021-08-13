class ArtworksController < ApplicationController
  def index
    # @artworks = Artwork.all
    # render json: @artworks
    if params[:user_id]
      render json: Artwork.find_by(id: params[:user_id])
    else
      render json: { error: 'The user does not exist' }, status: 404
    end
  end
  
  def show
    @artwork = Artwork.find_by(id: params[:id])
    if @artwork
      render json: @artwork
    else
      render json: { error: 'There is no artwork at that ID' }, status: 404
    end
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.artist_id = User.first.id
    if @artwork.save
      redirect_to artworks_url(@artwork)
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  def update
    @artwork = Artwork.find_by(id: params[:id])
    unless @artwork
      render json: { error: 'There is no artwork with that id.' }, status: 404
      return
    end

    if @artwork.update(user_params)
      redirect_to artworks_url(@artwork)
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    @artwork = Artwork.find_by(id: params[:id])
    if @artwork
      @artwork.destroy
      redirect_to artworks_url
    else
      render json: { error: 'There is no artwork with that id.' }, status: 404
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
