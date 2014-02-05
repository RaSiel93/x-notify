if @item.item_type == 'Adv'
  object @adv
  attributes :id, :description, :created_at, :updated_at  
end

if @item.item_type == 'Event'
  object @event
  attributes :id, :description, :created_at, :updated_at  
end

if @item.item_type == 'Discount'
  object @discount
  attributes :id, :description, :created_at, :updated_at  
end