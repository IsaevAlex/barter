class Service < ActiveRecord::Base
	belongs_to :user
	validates_length_of :content, :maximum => 1000
	validates_length_of :content, :minimum => 10
end
