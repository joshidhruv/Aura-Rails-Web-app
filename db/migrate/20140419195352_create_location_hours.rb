class CreateLocationHours < ActiveRecord::Migration
  def change
    create_table :location_hours do |t|

      t.timestamps
    end
  end
end
