class AddServiceIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :service_id, :integer
  end
end
