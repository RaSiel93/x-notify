class AddColumnDescriptionInItems < ActiveRecord::Migration
  def change
    add_column :advs, :description, :string
    add_column :discounts, :description, :string
    add_column :events, :description, :string
  end
end
