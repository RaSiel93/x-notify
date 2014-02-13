class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.boolean :published
      t.references :content, polymorphic: true

      t.timestamps
    end
  end
end
