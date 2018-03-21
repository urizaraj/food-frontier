class Restaurant < ApplicationRecord
  has_many :menu_items
  has_many :items, through: :menu_items
  has_many :item_tags, through: :items
end
