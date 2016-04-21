class OrdersController < ApplicationController
	before_action :find_order, only: [ :destroy, :show]

	def new 
	   @service = Service.find(params[:user_id])
	   session[:id] = @service.user.id
	   @order = current_user.sender_usered_orders.build
	end

	def show
		respond_to do |format|
      		format.js {}
    	end
    	
    	@order.read = true
    	@order.save
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

		def find_order
			@order = Order.find(params[:id])
		end

		def order_params
			params.require(:order).permit(:description)
		end
        
end
