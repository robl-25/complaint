Rails.application.routes.draw do

  namespace :api, defaults: { format: :json }, path: '/api' do
    namespace :v1, path: '/v1' do
      controller :complain do
        post '/complaint/new' => :new
      end

      controller :locale do
        get '/locale/search' => :search
      end
    end
  end
end
