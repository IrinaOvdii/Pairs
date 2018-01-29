class PairsController < ApplicationController

def index

  if current_user.admin
    @pairs = Pair.all
  elsif current_user.match_pairs.count > 0
    @pairs =  current_user.match_pairs
  else
    @pairs =  current_user.student_pairs
  end
end



end
