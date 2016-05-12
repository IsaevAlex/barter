class RemoveColumnFromUsers < ActiveRecord::Migration
  	def self.up
  	  	remove_column :users, :city
  	end
end
