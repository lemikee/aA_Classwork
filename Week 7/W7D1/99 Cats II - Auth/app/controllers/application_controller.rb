class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?


  # skip_before_action :verify_authenticity_token

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
    # returns current user or nil which are not true or false
  end
  
  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def require_logged_out
    redirect_to users_url if logged_in?
  end


  def login(user) # instead of login_user! we named method login
    session[:session_token] = user.reset_session_token!
  end

  def logged_in? # true or false
    !!current_user # not not true or not not false
  end

  def logout!
    current_user.reset_session_token! if logged_in?
    session[:session_token] = nil
    @current_user = nil
  end
end
