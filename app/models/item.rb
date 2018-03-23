class Item < ApplicationRecord
  has_many :menu_items
  has_many :restaurants, through: :menu_items
  has_many :item_to_item_tags
  has_many :item_tags, through: :item_to_item_tags

  validates :name, presence: true
  validates :description, presence: true
  validate :has_main_tag

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

  def has_main_tag
    unless %i[drink side entree].find_all { |sym| send(sym) }.size == 1
      errors.add(:base, 'Must be a drink, entree, or side')
    end
  end
end
