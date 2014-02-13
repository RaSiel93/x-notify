module ItemsHelper
  def item_show( item )
    case item.content.class.to_s.downcase
    when "adv" 
      items_adv_path( item )
    when "event" 
      items_event_path( item )
    when "discount" 
      items_discount_path( item )
    end
  end
  
  def edit_item( item )
    case item.content.class.to_s.downcase
    when "adv" 
      edit_items_adv_path( item )
    when "event" 
      edit_items_event_path( item )
    when "discount" 
      edit_items_discount_path( item )
    end
  end
end