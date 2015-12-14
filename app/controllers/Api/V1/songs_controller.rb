class Api::V1::SongsController < ApplicationController
  respond_to :json

  def index
    respond_with :api, :v1, Song.all
  end

  def show
    respond_with Song.find_by!(id: params[:id])
  end

  def create
    @song = Song.create(song_params)
    respond_with :api, :v1, @song
  end

  def destroy
    respond_with Song.destroy(params[:id])
  end

  def update
    @song = Song.find_by!(id: params[:id])
    @song.update_attributes(song_params)
    redirect
  end

  private

  def song_params
    params.permit(:id, :title, :artist_id, :album_id)
  end
end
