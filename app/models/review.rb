class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :title, presence: true
  validates :rating, presence: true
  validates :content, presence: true

  validates :user_id, uniqueness: {scope: :restaurant, message: 'can only have one review per restaurant'}

  after_save :update_restaurant_rating
  after_destroy :update_restaurant_rating

  def update_restaurant_rating
    restaurant.update_rating
  end
end
