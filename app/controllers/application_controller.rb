class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  skip_before_filter  :verify_authenticity_token

  protect_from_forgery with: :null_session

  before_action :authenticate

  private
    def authenticate
      render text: "{'error': 'Unauthorized. Expecting bearer token'}", status: 401 unless request.headers["Authorization"] == "Bearer 35148ad62db32ff044d6df2cd57"
    end
end
