Rails.application.routes.draw do
  root to: "home#home"


  namespace :api do
    namespace :v1 do
      resources :artists
      resources :albums
      resources :songs
      resources :complete_info, only: [:show]
    end
  end
end
