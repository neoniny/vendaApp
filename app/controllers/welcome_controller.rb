class WelcomeController < ApplicationController
	before_filter :authorizeadmin, :only => [:admin]
 	def index
		if current_user 
			redirect_to new_requirement_path
		else
			redirect_to log_in_path
		end
  end
end
