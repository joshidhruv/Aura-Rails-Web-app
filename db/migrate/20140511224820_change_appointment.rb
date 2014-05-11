class ChangeAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :guest_id, :integer
    add_column :appointments, :host_id, :integer
    add_column :appointments, :location_id, :integer
    add_column :appointments, :service_id, :integer
    add_column :appointments, :cost, :decimal
    add_column :appointments, :datetime_begin, :datetime
    add_column :appointments, :datetime_end, :datetime
    add_column :appointments, :notification_on, :boolean
    add_column :appointments, :next_notification, :datetime
    add_column :appointments, :notification_sent, :boolean
    add_column :appointments, :accepted, :boolean
    add_column :appointments, :paid, :boolean
    add_column :appointments, :completed, :boolean
  end
end
