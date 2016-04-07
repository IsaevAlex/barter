class FavoriteService < ActiveRecord::Base
	belongs_to :service
    belongs_to :user
    default_scope { order("created_at DESC") }
end
