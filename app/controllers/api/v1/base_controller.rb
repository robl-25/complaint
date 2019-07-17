module Api
  module V1
    class BaseController < ApplicationController
      before_action :authenticate
      skip_before_action :verify_authenticity_token

      def initialize
        @credentials = Settings.api_keys.map{ |k, v| [v["username"], v["password"]] }.to_h
      end

      def authenticate
        success = authenticate_with_http_basic do |username, password|
          @credentials[username] && @credentials[username] == password
        end

        if success
          return true
        else
          request_http_basic_authentication("Application")
          return false
        end
      end
    end
  end
end
