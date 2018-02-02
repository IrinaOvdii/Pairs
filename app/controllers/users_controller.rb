class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    make_user_admin
    @user.update_attributes(user_params)

    redirect_to users_path

  end

  def make_user_admin
    @user.make_admin
  end

  def user_params
    user_params = params.require(:user).permit(:admin, :name)
  end

end
