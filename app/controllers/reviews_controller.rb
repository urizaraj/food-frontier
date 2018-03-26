class ReviewsController < ApplicationController
  before_action :set_review, only: %i[edit update destroy]
  before_action :set_parent

  def index
    @reviews = @parent.reviews
  end

  def new
    @review = @parent.reviews.build
    @review.user = current_user
  end

  def create
    @review = Review.new(strong_params)
    return head(:forbidden) unless same_user?(@review)
    return render :new unless @review.save
    redirect_to @parent
  end

  def update
    return render :edit unless @review.update(strong_params)
    redirect_to @parent
  end

  def destroy
    @review.destroy
    redirect_to @parent
  end

  private

  def set_review
    @review = Review.find(params[:id])
    return head(:forbidden) unless same_user?(@review) || admin?
  end

  def set_parent
    restaurant = Restaurant.find_by(id: params[:restaurant_id])
    user = User.find_by(id: params[:user_id])
    @parent = restaurant || user
  end

  def strong_params
    params.require(:review).permit(
      :title, :content, :rating, :restaurant_id, :user_id
    )
  end

  def same_user?(review)
    review.user == current_user
  end
end
