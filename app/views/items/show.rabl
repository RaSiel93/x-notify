if @item.item_type == 'Adv'
  object @adv
  attributes :id, :discription, :created_at, :updated_at  
end

if @item.item_type == 'Event'
  object @event
  attributes :id, :discription, :created_at, :updated_at  
end

if @item.item_type == 'Discount'
  object @discount
  attributes :id, :discription, :created_at, :updated_at  
end