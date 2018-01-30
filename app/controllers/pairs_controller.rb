class PairsController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_user

  def index
    pairs = []
    match_pairs = current_user.match_pairs.where(match_id: current_user.id)
    student_pairs = current_user.student_pairs.where(student_id: current_user.id)
    pairs << student_pairs
    pairs << match_pairs
    pairs = pairs.flatten
    #pairs[i][i].student.name

    if current_user.admin
      @pairs = current_user.pairs
    else
      @pairs =  pairs
    end
  end

  def new
    @pair = Pair.new
  end

#Why is this not working??
  def create
    @students = User.all_students
    new_pair = @students.sample(2)
    student = new_pair[0]
    match = new_pair[1]

    @pair = current_user.pairs.create(pair_params.merge({
      student_id: student,
      match_id: match
      }))
    redirect_to pairs_path, notice: "Pairs are created!"
  end

   private
   def pair_params
    params.require(:pair).permit(:student_id, :match_id, :user_id, :day)
   end
   def setup_user
     @user = current_user
   end
end
