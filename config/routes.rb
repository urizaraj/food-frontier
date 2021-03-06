Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'static#home'

  resources :restaurants do
    get 'set_prices', on: :member
    get 'most_reviewed', on: :collection
    resources :menu_items, only: %i[new create]
    resources :reviews, only: %i[index create edit update destroy]
  end

  # get 'restaurants/:id/set_prices', to: 'restaurants#set_prices', as: 'prices_restaurant' 

  resources :items
  resources :item_tags

  resources :users, only: [:show] do
    resources :reviews, only: %i[index edit update destroy]
  end
end
