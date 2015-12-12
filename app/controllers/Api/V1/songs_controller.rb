class SongsController < ApplicationController
  respond_to :json

  def index
    respond_with Song.all
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
    respond_with Song.update(song_params)
  end

  private

  def song_params
    params.require(:song).permit(:id, :title, :artist_id)
  end
end
