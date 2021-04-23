class ArtworksController < ApplicationController
  def index
    render plain: "I'm in the index action!"
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save!
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork = Artwork.find_by(id: params[:id])
    artwork.destroy
    render json: artwork

  end

  def show
    artwork = Artwork.find_by(id: params[:id])
    render json: artwork
  end


  def update
    artwork = Artwork.find_by(id: params[:id])
    artwork = artwork.update(artwork_params)
    render json: artwork
  end



  private

  def artwork_params
    params.require(:artwork).permit(:artist_id, :title, :image_url)
  end

end
