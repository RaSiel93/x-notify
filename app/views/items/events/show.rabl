object @event.item
attributes :id, :content_id, :created_at, :updated_at  
child(:content) { attributes :id, :description }
