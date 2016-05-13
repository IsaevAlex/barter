class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_name, :string
    add_column :users, :middle_name, :string
  end
end
