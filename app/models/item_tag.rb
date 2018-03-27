class ItemTag < ApplicationRecord
  has_many :item_to_item_tags
  has_many :items, through: :item_to_item_tags

  validates :name, presence: true

  def self.main
    where(name: %w[Entree Side Drink])
  end

  def self.other
    where.not(name: %w[Entree Side Drink])
  end

  def self.drink
    exists?(name: 'Drink')
  end

  def self.entree
    exists?(name: 'Entree')
  end

  def self.side
    exists?(name: 'Side')
  end
end
