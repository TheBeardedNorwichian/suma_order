class CreateBaseData < ActiveRecord::Migration
  def change
    create_table :base_data do |t|

      t.string  :category_name
      t.string  :brand
      t.string  :code
      t.string  :description
      t.string  :details
      t.string  :size
      t.decimal :price
      t.boolean :vat
      t.decimal :rrp
      t.boolean :b 
      t.boolean :f 
      t.boolean :g 
      t.boolean :o
      t.boolean :s 
      t.boolean :v

      t.timestamps
    end
  end
end
