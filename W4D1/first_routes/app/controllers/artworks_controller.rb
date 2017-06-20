class ArtworksController < ApplicationController

  # def create
  #   @artwork = Artwork.new(artwork_params)
  #   if @artwork.save
  #     render json: @artwork
  #   else
  #     render(
  #       json: artwork.errors.full_messages, status: :unprocessable_entity
  #     )
  #   end
  # end

  def create
    @artwork = Artwork.new(artwork_params)

    if @artwork.save
      render :json => @artwork, :status => :created
    else
      render(
        :json => @artwork.errors.full_messages,
        :status => :unprocessable_entity
      )
    end
  end

  def destroy
    @artwork = find_artwork
    @artwork.destroy
    render :json => @artwork
  end

  def index
    render json: Artwork.all
  end

  def show
    @artwork = find_artwork
    render :show
  end

  def update
    @artwork = find_artwork
    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors, status: :unprocessable_entity
    end
  end

  private

  def find_artwork
    Artwork.find(params[:id])
  end

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

end
