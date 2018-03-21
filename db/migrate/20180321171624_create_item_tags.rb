class CreateItemTags < ActiveRecord::Migration[5.1]
  def change
    create_table :item_tags do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
