class CreateItemToItemTags < ActiveRecord::Migration[5.1]
  def change
    create_table :item_to_item_tags do |t|
      t.integer :item_id
      t.integer :item_tag_id

      t.timestamps
    end
  end
end
