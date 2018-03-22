class Item < ApplicationRecord
  has_many :menu_items
  has_many :restaurants, through: :menu_items
  has_many :item_to_item_tags
  has_many :item_tags, through: :item_to_item_tags

  def drink
    item_tags.include?(ItemTag.find_by(name: 'Drink'))
  end

  def side
    item_tags.include?(ItemTag.find_by(name: 'Side'))
  end

  def entree
    item_tags.include?(ItemTag.find_by(name: 'Entree'))
  end

  def self.drinks
    all.find_all(&:drink)
  end

  def self.sides
    all.find_all(&:side)
  end

  def self.entrees
    all.find_all(&:entree)
  end
end
