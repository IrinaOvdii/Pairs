class PairsController < ApplicationController

  def index
    pairs = []
    match_pairs = current_user.match_pairs.where(match_id: current_user.id)
    student_pairs = current_user.student_pairs.where(student_id: current_user.id)
    pairs << student_pairs
    pairs << match_pairs
    pairs = pairs.flatten
    #pairs[i][i].student.name

    if current_user.admin
      @pairs = Pair.all
    else
      @pairs =  pairs
    end
  end

  private

  # def pairs_array
  #
  # end

end
