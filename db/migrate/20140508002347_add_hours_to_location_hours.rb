class AddHoursToLocationHours < ActiveRecord::Migration
  def change
    add_column :location_hours, :day_of_week, :string
    add_column :location_hours, :open, :Date
    add_column :location_hours, :close, :Date
  end
end
