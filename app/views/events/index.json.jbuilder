json.array!(@events) do |event|
  json.extract! event, :id, :discription
  json.url event_url(event, format: :json)
end
