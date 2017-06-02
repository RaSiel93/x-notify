object @event.item
attributes :id, :content_id, :timestamp
child(:content) { attributes :id, :description }
