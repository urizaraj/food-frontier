Rails.application.routes.draw do
  devise_for :users
  root to: 'static#home'

  resources :restaurants do
    resources :menu_items
  end

  resources :items
  resources :item_tags

  get 'restaurants/:id/set_prices', to: 'restaurants#set_prices', as: 'prices_restaurant'
end
