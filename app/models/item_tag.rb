class ItemTag < ApplicationRecord
  has_many :item_to_item_tags
  has_many :items, through: :item_to_item_tags
end
