class RemoveColumnsToUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :name, :string
  	remove_column :users, :last_name, :string
  	remove_column :users, :middle_name, :string
  end
end
