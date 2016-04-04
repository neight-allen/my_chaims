class API::V1::APIController < ApplicationController
  TOKEN = "35148ad62db32ff044d6df2cd57"

  before_action :authenticate

  private
    def authenticate
      if !authenticate_with_http_token { |t, o| t == TOKEN }
        request_http_token_authentication
      end
    end

end
