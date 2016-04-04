class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  TOKEN = "35148ad62db32ff044d6df2cd57"

  skip_before_filter  :verify_authenticity_token

  protect_from_forgery with: :null_session

  before_action :authenticate

  private
    def authenticate
      if !authenticate_with_http_token { |t, o| t == TOKEN }
        request_http_token_authentication
      end
    end
end
