class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :code
      t.string :description
      t.string :details
      t.decimal :price, precision: 8, scale: 2
      t.decimal :rrp, precision: 8, scale: 2
      t.string :size
      t.integer :category_id
      t.integer :brand_id

      t.timestamps
    end

    add_index :items, :code, unique: true
  end
end
