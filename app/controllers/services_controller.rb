class ServicesController < ApplicationController
	before_action :find_service, only: [ :destroy, :edit, :update, :show, :favorite, :share ]
    respond_to :html, :json
    
    def autocomplete
    	render json: Service.search(params[:query], autocomplete: true, limit: 10).map(&:content)
    end	

    def index
        if params[:query].present?
  			@services = Service.search(params[:query], page: params[:page], per_page: 5)
  		else
      		@services = Service.paginate(:page => params[:page], :per_page => 5)
      	end
    end

	def new
		@service = Service.new
		
		respond_to do |format|
      		format.js {}
    	end
	end

	def create
		@service = current_user.services.build(service_params)
		
		if  @service.save
			flash[:success] = "Услуга успешно создана"
			redirect_to current_user
		else
			flash[:error] = "Ошибка при добавлении предложения. Попробуйте снова.\n Предложение не может быть пустым и должно иметь длину от 10 до 1000 символов"

      		redirect_to :back
  		end
	end

	def show
		respond_to do |format|
      		format.js {}
    	end
    	@service.read = true
    	@service.save
	end

	def favorite
	    type = params[:type]
	    if type == "favorite"
	      current_user.favorites << @service
	      redirect_to :back, notice: 'Вы добавили в избранное предложение'

	    elsif type == "unfavorite"
	      current_user.favorites.delete(@service)
	      redirect_to :back, notice: 'Вы удалили из избранных предложение'

	    else
	      # Type missing, nothing happens
	      redirect_to :back
	    end
    end

    def edit
		respond_to do |format|
      		format.js {}
    	end
	end

	def update
		if @service.update(service_params)
			flash[:success] = "Услуга успешно обновлена"
			redirect_to current_user
		else
			render '_form'
		end
    end

	def destroy
		@service.destroy
		flash[:success] = "Предложение успешно удалено"
		redirect_to current_user
	end

	private
		def find_service
			@service = Service.find(params[:id])
		end

		def service_params
			params.require(:service).permit(:content, images_attributes: [:id, :avatar, :_destroy])
		end
end
