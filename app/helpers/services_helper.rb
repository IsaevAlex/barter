module ServicesHelper
	def unread_services_count
    	@user.all_following.each do |user| 
    		return user.services.where(read:false).count
    	end
    end

    def all_following_services_count
    	@user.all_following.each do |user| 
    		return user.services.all.count
    	end
    end

    def favorite_services_count
        return @user.favorites.count
    end
end
