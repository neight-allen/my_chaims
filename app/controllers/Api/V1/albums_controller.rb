class Api::V1::AlbumsController < ApplicationController
  respond_to :json

  def index
    respond_with :api, :v1, Album.all
  end

  def show
    respond_with Album.find_by!(id: params[:id])
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      respond_with :api, :v1, @album
    else
      respond_with @album.errors.full_messages.join(", ")
    end
  end

  def update
    @album = Album.find_by!(id: params[:id])
    if @album.update_attributes(album_params)
      render json: @album, status: 200, location: [:api, :v1, @album]
    else
      album_errors = @album.errors.full_messages.join(", ")
      render json: album_errors, location: [:api, :v1, album_errors]
    end
  end

  private

  def album_params
    params.permit(:id, :title, :year, :artist_id)
  end
end
