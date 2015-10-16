json.array!(@carts) do |cart|
  json.extract! cart, :id, :city_id
  json.url cart_url(cart, format: :json)
end
