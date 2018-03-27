class Item < ApplicationRecord
  has_many :menu_items
  has_many :restaurants, through: :menu_items
  has_many :item_to_item_tags
  has_many :item_tags, through: :item_to_item_tags

  validates :name, presence: true
  # validates :description, presence: true
  validate :has_main_tag

  def drink
    item_tags.drink
  end

  def side
    item_tags.side
  end

  def entree
    item_tags.entree
  end

  def self.type(name)
    joins(:item_tags).where(item_tags: { name: name })
  end

  def self.drinks
    type 'Drink'
  end

  def self.sides
    type 'Side'
  end

  def self.entrees
    type 'Entree'
  end

  def has_main_tag
    return if [drink, side, entree].one?
    errors.add(:base, 'Must be a drink, entree, or side')
  end
end
