class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]
  before_action :require_admin, only: %i[new create update destroy]

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
    redirect_to items_path
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

  def strong_params
    params.require(:item).permit(:name, :description, item_tag_ids: [])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end