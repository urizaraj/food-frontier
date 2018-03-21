Rails.application.routes.draw do
  root to: 'static#home'

  resources :restaurants
end
