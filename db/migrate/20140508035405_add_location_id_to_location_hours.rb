class AddLocationIdToLocationHours < ActiveRecord::Migration
  def change
    add_column :location_hours, :location_id, :integer
  end
end
