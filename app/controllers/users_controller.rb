class UsersController < ApplicationController
	before_action :find_user, only: [:edit, :show, :update, :destroy, :follow, :unfollow, :_following, :followers]

	def show
		
	end

	def _following
  		
   	end

   	def _following_services
   	end

	def _followers
   		
   	end

	

	private

		def find_user
				@user = User.find(params[:id])
		end
end
