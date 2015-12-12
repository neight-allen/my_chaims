Rails.application.routes.draw do

  namespace :Api do
    namespace :V1 do
      resources :artists
      resources :albums
      resources :songs
    end
  end
end
