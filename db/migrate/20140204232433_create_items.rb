class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_type
      t.integer :item_id

      t.timestamps
    end
  end
end
