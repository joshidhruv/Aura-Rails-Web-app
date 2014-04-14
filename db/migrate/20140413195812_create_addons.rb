class CreateAddons < ActiveRecord::Migration
  def change
    create_table :addons do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.string :company_id

      t.timestamps
    end
  end
end
