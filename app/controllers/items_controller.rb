class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(strong_params)
    return render :new unless @item.save
    redirect_to @item
  end

  private

  def strong_params
    params.require(:item).permit(:name, :description)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end