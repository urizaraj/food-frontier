class MenuItemsController < ApplicationController
  before_action :set_restaurant

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end