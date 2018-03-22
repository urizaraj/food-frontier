class MenuItem < ApplicationRecord
  belongs_to :restaurant
  belongs_to :item

  def name
    item.name
  end

  def self.drinks
    type(:drink)
  end

  def self.sides
    type(:side)
  end

  def self.entrees
    type(:entree)
  end

  def self.type(sym)
    all.find_all { |mi| mi.item.send(sym)}
  end
end
