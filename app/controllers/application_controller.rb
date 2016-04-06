class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  helper_method :current_user, :logged_in?
  
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  
  def logged_in?
    !!current_user
  end
  
  
  def require_user
    if !logged_in?
      flash[:danger] = 'You must be logged in.'
      redirect_to root_path
    end
  end
	
	def require_admin
		if logged_in? && !current_user.admin? 
			flash[:danger] = 'Only an admin can perform that action.'
			redirect_to root_path
		end
	end
end
