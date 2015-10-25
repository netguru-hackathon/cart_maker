class AddPhotoUrlAndNameToCartProduct < ActiveRecord::Migration
  def change
    add_column :cart_products, :name, :string
    add_column :cart_products, :photo_url, :string
  end
end
