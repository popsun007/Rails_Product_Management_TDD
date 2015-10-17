class ChangeColumn < ActiveRecord::Migration
  def change
    rename_column :products, :price, :pricing
  end
end
