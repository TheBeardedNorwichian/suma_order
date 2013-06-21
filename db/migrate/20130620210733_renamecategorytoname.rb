class Renamecategorytoname < ActiveRecord::Migration
  def change
    rename_column :categories, :category, :name
    rename_column :brands, :brand, :name
  end
end
