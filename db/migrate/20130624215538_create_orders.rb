class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :open
      t.date :deadline
      t.date :delivery
      t.boolean :order_sent

      t.timestamps
    end
  end
end
