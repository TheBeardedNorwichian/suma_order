class AddCurrentOrderToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :current_order, :integer
  end
end
