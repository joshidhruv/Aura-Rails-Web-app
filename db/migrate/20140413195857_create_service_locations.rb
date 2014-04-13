class CreateServiceLocations < ActiveRecord::Migration
  def change
    create_table :service_locations do |t|
      t.integer :service_id
      t.integer :location_id

      t.timestamps
    end
  end
end
