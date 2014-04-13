class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :minutes_duration
      t.integer :company_id
      t.boolean :all_staff

      t.timestamps
    end
  end
end
