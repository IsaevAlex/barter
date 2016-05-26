class LocationsController < ApplicationController
	before_action :find_location, only: [:show, :edit, :destroy]

	def show
		respond_to do |format|
      		format.js {}
    	end
	end

	def new
		@location = Location.new
		respond_to do |format|
      		format.js {}
    	end
	end

	def create
		@location = current_user.locations.build(location_params)
		if  @location.save
			flash[:success] = "Адрес успешно создан"
			redirect_to current_user
		else
			flash[:notice] = "Ошшибка :("
      		redirect_to :back
  		end
	end 

	def index
		@locations = Location.all
	end

	def destroy
		@location.destroy
		redirect_to current_user
	end

	


	private
		def find_location
			@location = Location.find(params[:id])
		end

		def location_params
			params.require(:location).permit(:address, :longitude, :latitude)
		end
end
