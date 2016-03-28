class UsersController < ApplicationController
	before_action :find_user, only: [:edit, :show, :update, :destroy, :follow, :followers]
	# before_action :find_user_id, only: [:followers, :follow]

	def show
	end

	def index
		if params[:category].blank?
			@users = User.all.order("created_at DESC ")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@users = User.where(category_id: @category_id).order("created_at DESC")
		end
	end

	def follow
	end

	def followers
	end

  	


	

	private

		def find_user
				@user = User.find(params[:id])
		end

		
end
