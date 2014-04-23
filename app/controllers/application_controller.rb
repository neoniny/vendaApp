class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :admin?

  private 
  def current_user
  	@current_user ||= session[:username]
  end

  def admin?
  	session[:username] == 'admin'
  end

  def authorizeuser
  	unless current_user
  		redirect_to log_in_path, :notice => "Please log in first!"
  		false
  	end
  end

  def authorizeadmin
  	unless admin?
  		redirect_to log_in_path, :notice => "Unauthorize access"
  		false
  	end
  end
end
