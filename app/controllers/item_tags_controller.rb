class ItemTagsController < ApplicationController
  before_action :set_tag, only: %i[show edit update]

  def index
    @main = ItemTag.main
    @other = ItemTag.other
  end

  def new
    @tag = ItemTag.new
  end

  def create
    @tag = ItemTag.new(strong_params)
    return render :new unless @tag.save
    redirect_to @tag
  end

  private

  def strong_params
    params.require(:item_tag).permit(:name, :description)
  end

  def set_tag
    @tag = ItemTag.find(params[:id])
  end
end