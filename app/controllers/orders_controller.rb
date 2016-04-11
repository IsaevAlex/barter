class OrdersController < ApplicationController
	def new 
	   @service = Service.find(params[:user_id])
	   session[:id] = @service.user.id
	   @order = current_user.sender_usered_orders.build
	end

	def create
		@order = current_user.sender_usered_orders.build(order_params)
		@order.sender_user_id = current_user.id
		@order.recipient_user_id = session[:id]
		if  @order.save
			OrderMailer.order_create(@order).deliver 
		    flash[:success] = "Письмо успешно отправлено"
			redirect_to :back
		else
			render 'new'
		end
	end

	private
		def order_params
			params.require(:order).permit(:description)
		end
        
end
