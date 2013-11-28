class SessionsController < ApplicationController
	def new
	end

	def create
		if (params[:username] != "")
        	session[:username] = params[:username]
  			redirect_to root_url, :notice => "Logged in!"
  		else
  			redirect_to log_in_path
  		end

    end

  	def destroy
		session[:username] = nil
		redirect_to root_url, :notice => "Logged out!"
	end
end
