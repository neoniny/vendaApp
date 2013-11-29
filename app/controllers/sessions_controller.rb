class SessionsController < ApplicationController
	def new
		if session[:username]
			redirect_to root_url
		end
	end

	def create
		if (params[:username] != "")
        	session[:username] = params[:username]
  			redirect_to root_url
  		else
  			redirect_to log_in_path, :notice => "please enter valid value"
  		end

    end

  	def destroy
		session[:username] = nil
		redirect_to root_url
	end
end
