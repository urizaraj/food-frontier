class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(strong_params)
    return render :new unless @item.save
    redirect_to @item
  end

  def update
    @item.update(strong_params)
    redirect_to @item
  end

  private

  def strong_params
    params.require(:item).permit(:name, :description, item_tag_ids: [])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end