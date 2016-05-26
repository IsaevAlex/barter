class Service < ActiveRecord::Base
 	searchkick autocomplete: ['content']

	belongs_to :user
	validates_length_of :content, :maximum => 1000
	validates_length_of :content, :minimum => 10
	validates(:content, presence: true)

    has_many :favorite_services  
    has_many :favorited_by, through: :favorite_services, source: :user
    has_many :images, dependent: :destroy
    has_many :comments, dependent: :destroy
    accepts_nested_attributes_for :images
    validates_associated :images
end
