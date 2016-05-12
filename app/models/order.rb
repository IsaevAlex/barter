class Order < ActiveRecord::Base
	 belongs_to :sender_user, :class_name => "User"
     belongs_to :recipient_user, :class_name => "User"
     validates(:description, presence: true)
     validates_length_of :description, :maximum => 200
	 validates_length_of :description, :minimum => 5
	
end
