json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :quantity, :description, :List_id
  json.url product_url(product, format: :json)
end
