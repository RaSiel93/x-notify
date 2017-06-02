class Discount < ActiveRecord::Base
  has_one :item, as: :content, dependent: :destroy

  accepts_nested_attributes_for :item
end
