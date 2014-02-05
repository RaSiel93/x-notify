class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.integer :parent_id
      t.datetime :date
      t.timestamps
    end
  end
end
