class UsersController < ApplicationController
  load_and_authorize_resource except: [:create]
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def applying
    # @title = "Applying"
    # @user = User.find(params[:id])
    # @jobapps = @user.applied_jobapps.paginate(page: params[:page])
    # render 'show_applying'
  end
  
  def new
  end

  def edit
  end

  def update
    # ditto
    # @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash.now[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @jobapps = @user.applied_jobapps
  end

  # for user who logged in to see all users
  def index
    @users = User.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:success] = "Welcome to the Sample App!"
      sign_in @user
      redirect_to jobapps_path
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
    :password_confirmation)
  end

  # only user signed in can ...
  def signed_in_user
    unless signed_in?
      flash.now[:danger] = "Please sign in first."
      # store the edit location for redirect back
      store_location
      redirect_to signin_url
    end
  end

  # only user him/herslf can ...
  def correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      flash.now[:danger] = "You can only change your own profile."
      redirect_to signin_url
    end
  end

  # check whether the user is admin 
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

end
