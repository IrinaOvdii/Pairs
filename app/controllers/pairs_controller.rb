class PairsController < ApplicationController

def index

  if current_user.admin
    @pairs = Pair.all
  else
    @pairs = Pair.find_all_user
  end



  # elsif current_user.match_pairs.count > 0
  #   @pairs =  current_user.match_pairs
  # else
  #   @pairs =  current_user.student_pairs
  # end
end



end
