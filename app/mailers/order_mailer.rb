class OrderMailer < ApplicationMailer
	def order_create(order)
		@order = order
		mail(to: @order.recipient_user.email,
			 subject: "Вам прислали сообщение",
			 from: "barterco@service.com") 
	end
end
