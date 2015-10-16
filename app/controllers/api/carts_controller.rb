require "net/http"
require "uri"
module Api
  class CartsController < ApplicationController
    def update
      @cart = City.find_by_name(params[:region_name]).carts.first
      pip_id = params[:pip_url].split('/').last
      @product = Product.find_by_pip_id(pip_id) || Product.new(pip_id: pip_id)

      if @product.name.blank?
        uri = URI.parse(params[:pip_url])
        response = Net::HTTP.get_response(uri)
        @product.name = Net::HTTP.get_print(uri).scan(/(?<=itemprop=\"name\">)(.*)(?=<)/)
        @product.save
      end

      @cart_product = CartProduct.new
      @cart_product.cart_id = @cart.id
      @cart_product.product_id = @product.id
      @cart_product.quantity = params[:quantity]
      @cart_product.save
    end

    private

    def cart_params
      params.require(:cart).permit(:region_name, :pip_url, :quantity)
    end
  end
end
