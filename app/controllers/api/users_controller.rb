class Api::UsersController < ApplicationController
  def index
      render status: 200, json: {
        users: User.all
      }.to_json
  end

  def update
      render status: 200, json: {
        users: User.all
      }.to_json
  end

  private

  def user_params
    params.require(:user).permit(:name, :admin)

  def make_admin
    admin == true
  end
end
