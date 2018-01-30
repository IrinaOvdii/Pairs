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

  def make_admin
    admin == true
  end
end
