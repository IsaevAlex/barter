class CreateFavoriteServices < ActiveRecord::Migration
  def change
    create_table :favorite_services do |t|
      t.integer :user_id
      t.integer :service_id

      t.timestamps null: false
    end
  end
end
