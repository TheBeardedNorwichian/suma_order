class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|

      t.integer :item_id
      t.integer :user_id
      t.string  :notes

      t.timestamps
    end
  end
end
