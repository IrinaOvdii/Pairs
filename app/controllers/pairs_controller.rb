class PairsController < ApplicationController

def index
  if current_user.admin
    @pairs = Pair.all
  else
    @pairs =  current_user.match_pairs
  end
end



end
