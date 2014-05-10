class AddLocationHoursClosedColumn < ActiveRecord::Migration
  def change
    add_column :location_hours, :closed, :binary
  end
end
