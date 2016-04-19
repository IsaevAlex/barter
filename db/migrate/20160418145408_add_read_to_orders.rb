class AddReadToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :read, :boolean,  default: false
  end
end
