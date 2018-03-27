class StaticController < ApplicationController
  def home
    @restaurants = Restaurant.order(rating: :desc).limit(4)
  end
end
