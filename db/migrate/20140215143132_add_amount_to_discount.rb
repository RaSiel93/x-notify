class AddAmountToDiscount < ActiveRecord::Migration
  def change
    add_column :discounts, :amount, :integer
  end
end
