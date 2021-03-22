class ApplicationController < ActionController::Base
  #the methods defined here are avaible to all controllers
  
  helper_method :current_user, :logged_in? #make it avail for views 

  def current_user
    # if current_user, return it ||= if not, do this
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user #turn into boolean
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that activity"
      redirect_to login_path
    end
  end 
end
