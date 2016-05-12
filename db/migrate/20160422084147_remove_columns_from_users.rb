class RemoveColumnsFromUsers < ActiveRecord::Migration
  	def self.up
  		remove_column :users, :name
  		remove_column :users, :last_name
  		remove_column :users, :middle_name
  	end
end
