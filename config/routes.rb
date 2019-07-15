Rails.application.routes.draw do

  namespace :api, defaults: { format: :json }, path: '/api' do
    namespace :v1, path: '/v1' do
      controller :complain do
        post '/complaint/new' => :new
        get '/complain/search' => :search
      end
    end
  end
end
