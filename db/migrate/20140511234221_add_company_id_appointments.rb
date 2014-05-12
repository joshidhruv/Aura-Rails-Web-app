class AddCompanyIdAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :company_id, :integer
  end
end
