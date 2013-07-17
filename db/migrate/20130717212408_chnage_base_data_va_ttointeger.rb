class ChnageBaseDataVaTtointeger < ActiveRecord::Migration
  def change
    change_column :base_data, :vat, :decimal
  end
end
