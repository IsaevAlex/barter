class Order < ActiveRecord::Base
	 belongs_to :sender_user, :class_name => "User"
     belongs_to :recipient_user, :class_name => "User"
end
