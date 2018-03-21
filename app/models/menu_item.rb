class MenuItem < ApplicationRecord
  belongs_to :restaurant
  belongs_to :item

  def name
    item.name
  end
end
