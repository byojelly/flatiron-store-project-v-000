class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before_action :require_logged_in, except: []


  def logged_in?
    !!current_user
  end
  def require_logged_in
    redirect_to root_path unless logged_in?
  end
end
