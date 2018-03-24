class RestaurantsController < ApplicationController
  before_action :set_resource, only: %i[show edit update set_prices destroy]
  before_action :require_admin, only: %i[new create update destroy set_prices]

  def index
    @restaurants = Restaurant.all
  end

  def show
    return unless user_signed_in?
    @review = current_user.reviews.build
    @review.restaurant = @restaurant
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
    return render :set_prices unless @restaurant.update(strong_params)
    redirect_to @restaurant
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  def set_prices
    @menu_items = @restaurant.menu_items
  end

  private

  def strong_params
    params.require(:restaurant)
          .permit(:name,
                  :description,
                  :category,
                  item_ids: [],
                  menu_items_attributes: %i[price id])
  end

  def set_resource
    @restaurant = Restaurant.find(params[:id])
  end
end
