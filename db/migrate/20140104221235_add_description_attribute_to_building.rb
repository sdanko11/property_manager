class AddDescriptionAttributeToBuilding < ActiveRecord::Migration
  def up
    add_column :buildings, :description, :string
  end
  def down
    remove_column :buildings, :description
  end
end
