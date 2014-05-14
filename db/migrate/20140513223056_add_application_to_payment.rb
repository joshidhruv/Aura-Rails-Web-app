class AddApplicationToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :appointment_id, :integer
    add_column :payments, :cost, :integer
    add_column :payments, :status, :boolean
  end
end
