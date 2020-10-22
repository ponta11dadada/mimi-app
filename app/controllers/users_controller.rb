class UsersController < ApplicationController
  before_action :login_check
  def index
  	@user = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	@user.save
  	log_in @user
  	redirect_to @user
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_update_params)
  	redirect_to root_path
  end

  def destroy
  	@user = User.find(params[:id])
  	if @user.destroy
  	redirect_to root_path
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_update_params
  	params.require(:user).permit(:name, :email)
  end

  def login_check
    unless logged_in?
      flash[:alert] = "ログインしてください"
      redirect_to new_session_path
    end
  end

end
