class AddQuantityToOrderitem < ActiveRecord::Migration
  def change
    add_column :orderitems, :quantity, :integer, default: 1
  end
end
