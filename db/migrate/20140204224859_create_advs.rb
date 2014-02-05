class CreateAdvs < ActiveRecord::Migration
  def change
    create_table :advs do |t|
      t.string :discription

      t.timestamps
    end
  end
end
