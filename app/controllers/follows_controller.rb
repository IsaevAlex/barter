class FollowsController < ApplicationController
  	def create
    	@user = User.find(params[:user_id])
    	current_user.follow(@user)
    	respond_to do |format|
      		format.js { flash.now[:success] = "Вы подписались на #{@user.company_name}" }
    	end
  	end

  	def destroy
    	@user = User.find(params[:user_id])
    	current_user.stop_following(@user)
    	respond_to do |format|
      		format.js { flash.now[:success] = "Вы отписались от #{@user.company_name}" }
    	end
  	end

  	
end
