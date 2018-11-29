json.array!(@lists) do |list|
  json.extract! list, :id, :title, :description, :purchase
  json.url list_url(list, format: :json)
end
