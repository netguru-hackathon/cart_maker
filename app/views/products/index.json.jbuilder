json.array!(@products) do |product|
  json.extract! product, :id, :pip_id
  json.url product_url(product, format: :json)
end
