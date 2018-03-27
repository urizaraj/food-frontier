class AddRatingToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :rating, :float, default: 0
  end
end
