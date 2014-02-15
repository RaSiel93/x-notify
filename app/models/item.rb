class Item < ActiveRecord::Base
  belongs_to :content, polymorphic: true
  
  # scope :advs, conditions: { content_type: "Adv" }
  # scope :events, conditions: { content_type: "Event" }
  # scope :discount, conditions: { content_type: "Discount" }


  def created_at
    self[:created_at].to_i
  end
  
  def updated_at
    self[:updated_at].to_i
  end
end
