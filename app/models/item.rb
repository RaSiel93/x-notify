class Item < ActiveRecord::Base
  belongs_to :content, polymorphic: true

  scope :adertisings, conditions: { content_type: "Advertising" }
  scope :events, conditions: { content_type: "Event" }
  scope :discount, conditions: { content_type: "Discount" }

  def timestamp
    self[:created_at].to_i
  end
end
