class PairsController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_user

  STUDENTS = User.all_students.to_a
  $combination_students = []

  def index
    pairs = []
    match_pairs = current_user.match_pairs.where(match_id: current_user.id)
    student_pairs = current_user.student_pairs.where(student_id: current_user.id)
    pairs << student_pairs
    pairs << match_pairs
    pairs = pairs.flatten

    if current_user.admin
      @pairs = current_user.pairs
      @pairs_by_date = order_by_date
    else
      @pairs =  pairs
      @pairs_by_date =  pairs.sort_by {|pair| pair.day}
    end
  end

  def new
    @pair = Pair.new
  end

  def create

    if $combination_students.count == 0
      $combination_students = STUDENTS.combination(2).to_a
    end

    pairs = []

    #Make sure the first sample is random
    pair1 = $combination_students.sample
    $combination_students.delete(pair1)
    pairs << pair1
    students_in_pairs = pairs.flatten

    $combination_students.each do |pair|
      if !students_in_pairs.include?(pair[0]) && !students_in_pairs.include?(pair[1])
        pairs << pair
        students_in_pairs = pairs.flatten
        $combination_students.delete(pair)
      end
    end

    pairs.each do |pair|
      @pair = current_user.pairs.create(pair_params.merge({
        student: pair[0],
        match: pair[1]
        }))
    end
    redirect_to pairs_path, notice: "Pairs are created!"

  end

   private

   def pair_params
    params.require(:pair).permit(:student_id, :match_id, :user_id, :day)
   end

   def setup_user
     @user = current_user
   end

   def order_by_date
     current_user.pairs.order_date
   end

end
