class UsersController < ApplicationController
  def index
    if current_user.admin?
      @pairs = Pair.all
    else
      @pair =  current_user.student_pairs
  end
end
