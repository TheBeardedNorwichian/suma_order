class AddUnitPriceToItem < ActiveRecord::Migration
  def change
    add_column :items, :unit_price, :decimal, precision: 8, scale: 2
  end
end
