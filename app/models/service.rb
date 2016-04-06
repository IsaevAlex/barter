class Service < ActiveRecord::Base
 	searchkick autocomplete: ['content']

	belongs_to :user
	validates_length_of :content, :maximum => 1000
	validates_length_of :content, :minimum => 10

    has_many :favorite_services  
    has_many :favorited_by, through: :favorite_services, source: :service
   

end
