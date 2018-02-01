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

    if current_user.admin
      @pairs = Pair.all
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

    pairs = []
    current_students = User.all_students.to_a
    amount_pairs = current_students.length/2
    possible_pairs = current_students.length - 1

    if $taken_pairs.length == current_students.combination(2).to_a.length
      $taken_pairs = []
    end

    while amount_pairs > 0 do
      possible_pairs.times do
        pair = current_students.sample(2)
        pair = pair.sort
        if !$taken_pairs.include?(pair)
          current_students -= pair
          $taken_pairs << pair
          pairs << pair
          amount_pairs -= 1
          break
        elsif $taken_pairs.include?(pair) && current_students.length == 2
          current_students -= pair
          $taken_pairs << pair
          pairs << pair
          amount_pairs -= 1
          break
        else
          next
        end
      end
    end

    pairs.each do |pair|
      @pair = current_user.pairs.create(pair_params.merge({
        student: pair[0],
        match: pair[1]
        }))
    end
    redirect_to pairs_path

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
