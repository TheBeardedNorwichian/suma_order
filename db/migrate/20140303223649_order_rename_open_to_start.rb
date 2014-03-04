class OrderRenameOpenToStart < ActiveRecord::Migration
  def change
    rename_column :orders, :open, :orderopen
  end
end
