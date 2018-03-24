class Restaurant < ApplicationRecord
  has_many :menu_items
  has_many :items, through: :menu_items
  has_many :item_tags, through: :items
  has_many :reviews

  accepts_nested_attributes_for :menu_items

  validates :name, presence: true
  validates :description, presence: true

  def rating
    ratings = reviews.map(&:rating)
    ratings.empty? ? 0 : ratings.reduce(:+).to_f / ratings.size 
  end
end
