class UsersController < ApplicationController

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

    redirect_to @user

    # if @user.update_attributes(user_params)
    #   redirect_to @user
    # else
    #   render 'edit'
    # end
  end

  def make_user_admin
    @user.make_admin
  end

  def user_params
    user_params = params.require(:user).permit(:admin)
  end

end
