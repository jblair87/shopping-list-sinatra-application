class DropItemCategories < ActiveRecord::Migration[5.1]
  def change
    drop_table :item_categories
  end
end
