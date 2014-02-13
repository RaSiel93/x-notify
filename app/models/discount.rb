class Discount < ActiveRecord::Base
  has_one :items, as: :content, dependent: :destroy
end
