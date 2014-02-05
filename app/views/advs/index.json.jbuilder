json.array!(@advs) do |adv|
  json.extract! adv, :id, :discription
  json.url adv_url(adv, format: :json)
end
