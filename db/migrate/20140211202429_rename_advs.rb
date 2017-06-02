class RenameAdvs < ActiveRecord::Migration
  def self.up
    rename_table :advs, :advertisings
  end

 def self.down
    rename_table :advertisings, :advs
 end
end