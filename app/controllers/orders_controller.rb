class OrdersController < ApplicationController
	
	def new 
	   @user = User.find(params[:user_id])
	   session[:id] = @user.id
	   respond_to do |format|
      		format.js {}
       end
	end

	def create
		
		@order = current_user.sender_usered_orders.build(order_params)
		@order.sender_user_id = current_user.id
		@order.recipient_user_id = session[:id]
		
		if  @order.save
			OrderMailer.order_create(@order).deliver 
		    flash[:success] = "Письмо успешно отправлено"
			redirect_to current_user
		else
			render 'new'
		end
	end

	private
		def order_params
			params.require(:order).permit(:description)
		end
        

		def find_user
			
		end

end
