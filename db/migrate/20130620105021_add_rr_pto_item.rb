class AddRrPtoItem < ActiveRecord::Migration
  def change
    add_column :items, :rrp, :integer
  end
end
