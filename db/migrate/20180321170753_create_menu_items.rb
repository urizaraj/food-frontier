class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.integer :restaurant_id
      t.integer :item_id
      t.integer :price

      t.timestamps
    end
  end
end
