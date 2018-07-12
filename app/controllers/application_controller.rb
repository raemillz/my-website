class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  before_filter :authenticate, only: [:show]

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  private
  def authenticate
    redirect_to root_path unless current_user
  end

  def is_admin?
    redirect_to root_path unless (current_user && current_user.admin)
  end
end
