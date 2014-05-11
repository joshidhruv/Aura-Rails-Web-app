class AddCompanyIdToServices < ActiveRecord::Migration
  def change
    add_column :services, :company_id, :integer
    add_column :services, :name, :string
    add_column :services, :description, :text
    add_column :services, :price, :decimal
    add_column :services, :minutes_duration, :integer
    add_column :services, :all_staff, :boolean
  end
end
