object @discount.item
attributes :id, :content_id, :timestamp
child(:content) { attributes :id, :amount, :description }
