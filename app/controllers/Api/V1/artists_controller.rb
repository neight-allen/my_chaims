class Api::V1::ArtistsController < ApplicationController
  respond_to :json

  def index
    respond_with :api, :v1, Artist.all
  end

  def show
    respond_with Artist.find_by!(id: params[:id])
  end

  def create
    @artist = Artist.create(artist_params)

    respond_with :api, :v1, @artist
  end

  def destroy
    respond_with Artist.destroy(params[:id])
  end

  def update
    respond_with Artist.update(artist_params)
  end

  private

  def artist_params
    params.require(:artist).permit(:id, :name)
  end
end
