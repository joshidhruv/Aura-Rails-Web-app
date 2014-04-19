class CreateUserServices < ActiveRecord::Migration
  def change
    create_table :user_services do |t|

      t.timestamps
    end
  end
end
