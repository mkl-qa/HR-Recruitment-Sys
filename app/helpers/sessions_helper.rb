module SessionsHelper
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  # lazily find the user by remember_token
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
    @current_user ||= User.new
  end

  def current_user?(user)
    current_user == user
  end

  # is this session belong to a logged in user?
  def signed_in?
    !current_user.nil? && current_user.name
  end
  
  def is_recruiter?
    signed_in? && current_user.recruiter?
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

end
