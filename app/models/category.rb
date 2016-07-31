class Category < ActiveRecord::Base
	searchkick
	has_many :users
end
