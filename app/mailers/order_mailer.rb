class OrderMailer < ApplicationMailer
	def order_create(order)
		@order = order
		
		Mail.deliver do
  			to: @order.recipient_user.email
  			subject: "Вам прислали сообщение",
			from: "services@mydomain.com"
		end
	end
end
