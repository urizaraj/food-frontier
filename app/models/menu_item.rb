class MenuItem < ApplicationRecord
  belongs_to :restaurant
  belongs_to :item
end
