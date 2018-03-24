Rails.application.routes.draw do
  devise_for :users
  root to: 'static#home'

  resources :restaurants do
    resources :menu_items
    resources :reviews, only: %i[index create edit update destroy]
  end

  get 'restaurants/:id/set_prices', to: 'restaurants#set_prices', as: 'prices_restaurant'

  resources :items
  resources :item_tags

  resources :users, only: [:show] do
    resources :reviews, only: %i[index edit update destroy]
  end
end
