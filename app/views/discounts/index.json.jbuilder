json.array!(@discounts) do |discount|
  json.extract! discount, :id, :discription
  json.url discount_url(discount, format: :json)
end
