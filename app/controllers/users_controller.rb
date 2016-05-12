class UsersController < ApplicationController
	before_action :find_user, only: [:edit, :show, :update, :destroy, :follow, :followers]
	# before_action :find_user_id, only: [:followers, :follow]

	def show
		@recipient_usered_orders = @user.recipient_usered_orders.all
		@recipient_count = @user.recipient_usered_orders.where(read:false).count
		@sender_usered_orders = @user.sender_usered_orders.all
		@services = @user.services.paginate(:page => params[:page], :per_page => 5)
		@favorites = @user.favorites.paginate(:page => params[:page], :per_page => 5)
		@locations = @user.locations
	end

	def share
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
