class Item < ApplicationRecord
  has_many :menu_items
  has_many :restaurants, through: :menu_items
  has_many :item_to_item_tags
  has_many :item_tags, through: :item_to_item_tags

  validates :name, presence: true
  # validates :description, presence: true
  validate :has_main_tag

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

  def drink
    # item_tags.drink
    item_tags.any? { |it| it.name == 'Drink'}
  end

  def side
    # item_tags.side
    item_tags.any? { |it| it.name == 'Side'}
  end

  def entree
    # item_tags.entree
    item_tags.any? { |it| it.name == 'Entree'}
  end
end
