class MenuItemsController < ApplicationController
  before_action :set_restaurant

  def new
    @menu_item = MenuItem.new(restaurant_id: @restaurant.id)
  end

  def create
    @menu_item = MenuItem.new(strong_params)
    return render :new unless @menu_item.save
    redirect_to @restaurant
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def strong_params
    params.require(:menu_item).permit(
      :price,
      :restaurant_id,
      item_attributes: %i[description name item_tag_ids]
    )
  end
end
