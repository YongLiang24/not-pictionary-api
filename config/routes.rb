Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :canvas, only: [:create]
  resources :game
  resources :player
  resources :timer
  # mount the ActionCable server with a '/cable' endpoint-- will be used to instantiate websockets connection with the server
  mount ActionCable.server => '/cable'
end
