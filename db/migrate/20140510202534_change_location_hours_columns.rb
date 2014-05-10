class ChangeLocationHoursColumns < ActiveRecord::Migration
  def change
    change_column :location_hours, :open, :string
    change_column :location_hours, :close, :string
  end
end
