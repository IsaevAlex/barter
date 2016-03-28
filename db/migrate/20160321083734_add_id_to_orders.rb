class AddIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :sender_user_id, :integer
    add_column :orders, :recipient_user_id, :integer
  end
end
