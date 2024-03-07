class ApplicationController < ActionController::Base
  def current_user
    @current_user = User.find(session[:user_id]) if logged_in?
  end

  def logged_in?
    session[:user_id].present?
  end

  def authenticate_user!
    if logged_in?
      #
    else
      redirect_to new_sessions_path, alert: 'Faça login primeiro!'
    end
  end

  helper_method :current_user
  helper_method :logged_in?
end
