Rails.application.routes.draw do
  root "static_pages#index"
  resources :manufacturers
  resources :cars
end
