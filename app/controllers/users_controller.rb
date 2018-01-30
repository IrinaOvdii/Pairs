class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    user_params = params.require(:user).permit(:admin)

    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def make_admin
    admin == true
  end

end
