class AddRelationships < ActiveRecord::Migration
  def change
    create_join_table :users, :roles
    create_join_table :users, :locations
    create_join_table :services, :locations
  end
end
