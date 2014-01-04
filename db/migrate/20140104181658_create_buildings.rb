class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name, null:false
      t.string :address, null:false
      t.string :state, null:false
      t.string :zip_code, null:false
      t.integer :owner_id
      t.timestamps
    end
  end
end
