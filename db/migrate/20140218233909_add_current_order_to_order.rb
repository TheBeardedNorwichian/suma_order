class AddCurrentOrderToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :active_order, :boolean
  end
end
