module ApplicationHelper
	def fullname
		"#{@user.name} #{@user.last_name} #{@user.middle_name}"
	end

	
end
