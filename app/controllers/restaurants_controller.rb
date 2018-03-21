class RestaurantsController < ApplicationController
  before_action :set_resource, only: %i[show edit update]

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

  private

  def strong_params
    params
      .require(:restaurant)
      .permit(:name,
              :description,
              :category,
              item_ids: [])
  end

  def set_resource
    @restaurant = Restaurant.find(params[:id])
  end
end
