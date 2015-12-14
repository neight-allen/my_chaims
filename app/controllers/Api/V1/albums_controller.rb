class Api::V1::AlbumsController < ApplicationController
  respond_to :json

  def index
    respond_with :api, :v1, Album.all
  end

  def show
    respond_with Album.find_by!(id: params[:id])
  end

  def create
    @album = Album.create(album_params)

    respond_with :api, :v1, @album
  end

  def destroy
    respond_with Album.destroy(params[:id])
  end

  def update
    respond_with Album.update(album_params)
  end

  private

  def album_params
    params.require(:album).permit(:id, :title, :year, :artist_id)
  end


end
