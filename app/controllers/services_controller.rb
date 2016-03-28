class ServicesController < ApplicationController
    respond_to :html, :json

	def create
		@service = current_user.services.build(service_params)
		if @service.save
			flash[:success] = "Услуга успешно добавлена"
			redirect_to current_user
		else
			redirect_to current_user
		end
	end

	def update
		@user = User.find(params[:user_id])
		@service = @user.services.find(params[:id])
		@service.update_attributes(service_params)
        respond_with @user
        
	end

	def edit
		
	end

	def destroy
		@user = User.find(params[:user_id])
		@service = @user.services.find(params[:id])
		@service.destroy
		redirect_to @user
	end

	private

		def service_params
			params.require(:service).permit(:content)
		end
end
