class SessionsController < ApplicationController
	def new
		if session[:username]
			redirect_to root_url
		end
	end

	def create
		if (params[:username] != "")
        	session[:username] = params[:username]
        	session[:password] = params[:password]
        	if admin?
        		redirect_to admin_path
        	else
  				redirect_to root_url
  			end
  		else
  			redirect_to log_in_path, :notice => "please enter valid value"
  		end

    end

  	def destroy
		session[:username] = nil
    session[:entprs_name] = session[:api_param_hash] =nil
    session[:api_param] = nil
    session[:requirement_step] = session[:requirement_params] = nil
    session[:item_param] = nil
		redirect_to root_url
	end
end
