module OrdersHelper
	def order_count
		return @recipient_usered_orders.count + @sender_usered_orders.count
	end

	def recipient_usered_orders
		return @recipient_usered_orders.count 	
	end

	def sender_usered_orders
		return @sender_usered_orders.count 	
	end

end
