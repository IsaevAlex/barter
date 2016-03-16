class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone_number, :char
  end
end
