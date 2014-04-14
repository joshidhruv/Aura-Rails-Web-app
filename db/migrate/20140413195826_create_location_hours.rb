class CreateLocationHours < ActiveRecord::Migration
  def change
    create_table :location_hours do |t|
      t.integer :location_id
      t.time :open
      t.time :close

      t.timestamps
    end
  end
end
