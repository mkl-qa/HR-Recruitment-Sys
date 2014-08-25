class SessionsController < ApplicationController

  def new
    
  end
  
  # this is called from form_for session_path in new.html.erb
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
      sign_in user
      # redirect_to user
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
  
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
end
