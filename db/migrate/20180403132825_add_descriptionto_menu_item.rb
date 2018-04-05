class AddDescriptiontoMenuItem < ActiveRecord::Migration[5.1]
  def change
    add_column :menu_items, :restaurant_description, :string 
  end
end
