class RemoveQuantityFromOrderitem < ActiveRecord::Migration
  def change
    remove_column :orderitems, :quantity
  end
end
