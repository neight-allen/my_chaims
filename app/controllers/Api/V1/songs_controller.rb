class Api::V1::SongsController < ApplicationController
  respond_to :json

  def index
    respond_with :api, :v1, Song.all
  end

  def show
    respond_with Song.find_by!(id: params[:id])
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      respond_with :api, :v1, @song
    else
      respond_with @song.errors.full_messages.join(", ")
    end
  end

  def destroy
    respond_with Song.destroy(params[:id])
  end

  def update
    @song = Song.find_by!(id: params[:id])
    if @song.update_attributes(song_params)
      render json: @song, status: 200, location: [:api, :v1, @song]
    else
      song_errors = @song.errors.full_messages.join(", ")
      render json: song_errors, location: [:api, :v1, song_errors]
    end
  end

  private

  def song_params
    params.permit(:id, :title, :artist_id, :album_id)
  end
end
