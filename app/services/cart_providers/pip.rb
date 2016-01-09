module CartProviders
  class Pip < Base
    def sync
      spider = SyncServices::Pip.new
      spider.change_delivery_region(cart.city.region_name)
      spider.login('#', '#')

      cart.products.each do |product|
        spider.add_product_to_default_cart('243067', product.quantity)
      end

      spider.save_default_cart_to_fastcard(cart_sync_name)
    end

    private

    def cart_sync_name
      "#{cart.city.region_name} autogenerated #{Time.current}"
    end
  end
end