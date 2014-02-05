module ItemsHelper
  def get_text item
    case item.item_type
    when 'Discount'
      Discount.find_by_id( item.item_id ).discription
    when 'Event'
      Event.find_by_id( item.item_id ).discription
    when 'Adv'
      Adv.find_by_id( item.item_id ).discription
    end
  end
end
