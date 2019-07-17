Rails.application.routes.draw do

  root to: 'home#show'

  namespace :api, defaults: { format: :json }, path: '/api' do
    namespace :v1, path: '/v1' do
      controller :complain do
        post '/complain/new' => :new
        get '/complain/search' => :search
      end
    end
  end

  get '*path' => redirect('/')
end
