class AddCityToBuilding < ActiveRecord::Migration
  def up
    add_column :buildings, :city, :string, null:false
  end
  def down
    remove_column :buildings, :city
  end
end
