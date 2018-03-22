class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update]
  before_action :set_parent
  
  def new
    @review = @parent.reviews.build
  end

  def create
    @review = Review.new(strong_params)
    return render :new unless @review.save
    redirect_to @parent
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_parent
    restaurant = Restaurant.find_by(id: params[:restaurant_id])
    user = User.find_by(id: params[:user_id])
    @parent = restaurant || user
  end

  def strong_params
    params.require(:review).permit(:title, :content, :rating, :restaurant_id, :user_id)
  end
end