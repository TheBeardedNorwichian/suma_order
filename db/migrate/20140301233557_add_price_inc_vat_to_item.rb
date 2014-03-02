class AddPriceIncVatToItem < ActiveRecord::Migration
  def change
    add_column :items, :price_inc_vat, :decimal, precision: 8, scale: 2
  end
end
