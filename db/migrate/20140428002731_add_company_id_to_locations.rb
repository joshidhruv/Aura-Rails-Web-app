class AddCompanyIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :company_id, :string
    add_column :locations, :name, :string
    add_column :locations, :address1, :string
    add_column :locations, :address2, :string
    add_column :locations, :city, :string
    add_column :locations, :state, :string
    add_column :locations, :zip, :string
    add_column :locations, :phone, :string
    add_column :locations, :email, :string
    add_column :locations, :primary, :boolean
  end
end
