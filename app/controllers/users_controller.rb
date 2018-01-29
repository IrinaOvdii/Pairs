class UsersController < ApplicationController

  def index
    @users = User.all
  end

  # def call_make_admin
  #
  # end

end
