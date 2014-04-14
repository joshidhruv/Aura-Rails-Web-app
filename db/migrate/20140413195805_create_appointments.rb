class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :guest_id
      t.integer :host_id
      t.integer :location_id
      t.integer :service_id
      t.decimal :cost
      t.datetime :datetime_begin
      t.datetime :datetime_end
      t.boolean :notification_on
      t.boolean :notification_sent
      t.boolean :accepted
      t.boolean :completed

      t.timestamps
    end
  end
end
