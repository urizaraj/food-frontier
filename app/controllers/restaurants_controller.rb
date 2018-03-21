class RestaurantsController < ApplicationController
  before_action :set_resource, only: %i[show edit update set_prices]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(strong_params)

    return render :new unless @restaurant.save

    redirect_to @restaurant
  end

  def update
    @restaurant.update(strong_params)

    redirect_to @restaurant
  end

  def set_prices
    @menu_items = @restaurant.menu_items
  end

  private

  def strong_params
    params
      .require(:restaurant)
      .permit(:name,
              :description,
              :category,
              item_ids: [],
              menu_items_attributes: [:price, :id])
  end

  def set_resource
    @restaurant = Restaurant.find(params[:id])
  end
end
