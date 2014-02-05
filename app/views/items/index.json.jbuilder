json.array!(@items) do |item|
  json.extract! item, :id, :item_type, :item_id
  json.url item_url(item, format: :json)
end
