class AddVatToItem < ActiveRecord::Migration
  def change
    add_column :items, :vat, :boolean, default: false
  end
end
