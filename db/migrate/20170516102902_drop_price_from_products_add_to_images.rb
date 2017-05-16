class DropPriceFromProductsAddToImages < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :price
    add_column :productimages, :price, :decimal
  end
end
