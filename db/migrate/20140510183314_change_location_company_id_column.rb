class ChangeLocationCompanyIdColumn < ActiveRecord::Migration
  def change
    change_column :locations, :company_id, 'integer USING CAST(company_id AS integer)'
  end
end
