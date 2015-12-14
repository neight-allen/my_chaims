class Api::V1::ArtistsController < ApplicationController
  respond_to :json

  def index
    respond_with :api, :v1, Artist.all
  end

  def show
    respond_with Artist.find_by!(id: params[:id])
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      respond_with :api, :v1, @artist
    else
      respond_with @artist.errors.full_messages.join(", ")
    end
  end

  def destroy
    respond_with Artist.destroy(params[:id])
  end

  def update
    @artist = Artist.find_by!(id: params[:id])
    if @artist.update_attributes(artist_params)
      render json: @artist, status: 200, location: [:api, :v1, @artist]
    else
      artist_errors = @artist.errors.full_messages.join(", ")
      render json: artist_errors, location: [:api, :v1, artist_errors]
    end
  end

  private

  def artist_params
    params.permit(:id, :name)
  end
end
