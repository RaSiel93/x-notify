class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :discription

      t.timestamps
    end
  end
end
