class Item < ActiveRecord::Base
  belongs_to :content
  
  # scope :advs, conditions: { content_type: "Adv" }
  # scope :events, conditions: { content_type: "Event" }
  # scope :discount, conditions: { content_type: "Discount" }
end
