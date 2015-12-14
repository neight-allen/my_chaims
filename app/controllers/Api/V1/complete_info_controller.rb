class Api::V1::CompleteInfoController < ApplicationController
  respond_to :json
  def show
    @song = Song.find_by!(id: params[:id])
    render json: @song, include: [:album, :artist]
  end
end
