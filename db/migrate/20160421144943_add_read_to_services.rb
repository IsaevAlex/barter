class AddReadToServices < ActiveRecord::Migration
  def change
    add_column :services, :read, :boolean,  default: false
  end
end
