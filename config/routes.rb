Rails.application.routes.draw do
  root to: 'static#home'

  resources :restaurants do
    resources :menu_items
  end

  get 'restaurants/:id/set_prices', to: 'restaurants#set_prices', as: 'prices_restaurant'
end
