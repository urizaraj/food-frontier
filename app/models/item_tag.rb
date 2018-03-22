class ItemTag < ApplicationRecord
  has_many :item_to_item_tags
  has_many :items, through: :item_to_item_tags

  def self.main
    where(name: %w[Entree Side Drink])
  end

  def self.other
    where.not(name: %w[Entree Side Drink])
  end
end
