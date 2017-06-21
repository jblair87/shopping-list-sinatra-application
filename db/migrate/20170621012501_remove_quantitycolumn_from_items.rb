class RemoveQuantitycolumnFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :quantity, :integer
  end
end
