class RemoveProductIdFromCartProduct < ActiveRecord::Migration
  def change
    remove_column :cart_products, :product_id
  end
end
