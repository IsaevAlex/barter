class AddToCommentsServiceId < ActiveRecord::Migration
  def change
  	add_column :comments, :service_id, :integer
  end
end
