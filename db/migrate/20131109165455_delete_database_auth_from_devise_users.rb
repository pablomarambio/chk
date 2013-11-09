class DeleteDatabaseAuthFromDeviseUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :encrypted_password
  	change_column :users, :email, :string, null: true
  	remove_index :users, :email
  end
end
