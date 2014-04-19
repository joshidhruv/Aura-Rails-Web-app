class ChangeUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :business_name
    end
  end
end
