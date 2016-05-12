class CommentsController < ApplicationController
	def new 
	end

	def create
		@service = Service.find(params[:service_id])
		@comment = @service.comments.create(params[:comment].permit(:comment))
		@comment.user_id = current_user.id if current_user
		@comment.save

		if @comment.save
			flash[:success] = "Отзыв успешно добавлен"
			redirect_to :back
		else
			redirect_to @service
		end
	end

	def destroy
		@service = Service.find(params[:service_id])
		@comment = @service.comments.find(params[:id])
		@comment.destroy
		redirect_to :back
	end

end
