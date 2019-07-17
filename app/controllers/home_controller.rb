class HomeController < ApplicationController
  def show
    render json: {}, status: 404
  end
end
