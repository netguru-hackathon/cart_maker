require "net/http"
require "uri"
module Api
  class CartsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def update
      @cart = City.where(region_name: params[:region_name]).first.carts.first_or_create
      correct_uri = params[:product_link].slice(1..-2)
      pip_id = correct_uri.split('/').last
      @product = Product.where(pip_id: pip_id).first || Product.new(pip_id: pip_id)

      if @product.name.blank?
        uri = URI.parse(correct_uri)
        response = Net::HTTP.get_response(uri)
        @product.name = response.body.scan(/(?<=itemprop=\"name\">)(.*)(?=<)/).first.first || ""
        @product.save
      end

      @cart_product = CartProduct.new
      @cart_product.cart_id = @cart.id
      @cart_product.product_id = @product.id
      @cart_product.quantity = params[:product_amount]
      @cart_product.save
      render json: @cart_product
    end

    private

    def cart_params
      params.require(:cart).permit(:region_name, :product_link, :product_amount)
    end
  end
end
