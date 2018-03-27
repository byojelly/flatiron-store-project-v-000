class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_logged_in
  #before_action :require_logged_in, except: [:show]]
  #before_action :require_logged_in, except: [:index. :show, :new]]

  #before_action :require_logged_in, if: :devise_controller?
  #before_action :require_logged_in, except: [:index]

  def logged_in?
    !!current_user
  end
  def require_logged_in
    redirect_to store_path unless logged_in?
  end
end




#ADD STRONG PARAMS
