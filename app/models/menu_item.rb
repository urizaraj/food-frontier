class MenuItem < ApplicationRecord
  belongs_to :restaurant
  belongs_to :item
  has_many :item_tags, through: :item

  accepts_nested_attributes_for :item

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
    # all.find_all { |mi| mi.item.send(sym)}
    joins(:item_tags).where(item_tags: {name: sym.to_s.humanize})
  end

  def item_attributes=(params)
    item = Item.find_by(name: params[:name])
    self.item = item || Item.create(params)
  end

  def description
    return (self.restaurant_description ? self.restaurant_description : self.item.description)
  end
end
