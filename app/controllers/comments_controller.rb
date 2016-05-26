class CommentsController < ApplicationController
	def new 
	end

	def create
		@service = Service.find(params[:service_id])
		@comment = @service.comments.create(params[:comment].permit(:comment))
		@comment.user_id = current_user.id if current_user
		if @comment.save
			respond_to do |format|
		        format.js { flash.now[:success] = "Вы оставили отзыв" }
		    end
		end
	end

	def destroy
		@service = Service.find(params[:service_id])
		@comment = @service.comments.find(params[:id])
		@comment.destroy
		respond_to do |format|
      		  format.js { flash.now[:success] = "Вы удалили отзыв" }
    	end
	end

end
