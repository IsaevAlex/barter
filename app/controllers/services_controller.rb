class ServicesController < ApplicationController
	
	def create
		@service = current_user.services.build(service_params)
		if @service.save
			flash[:success] = "Услуга успешно добавлена"
			redirect_to current_user
		else
			redirect_to current_user
		end
	end

	def destroy
		
	end

	private

		def service_params
			params.require(:service).permit(:content)
		end
end
