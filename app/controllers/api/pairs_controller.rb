class Api::PairsController < Api::BaseController
before_action :setup_user
# skip_before_action :verify_authenticity_token
# protect_from_forgery with: :null_session

def index

  pairs = []
  match_pairs = @user.match_pairs.where(match_id: @user.id)
  student_pairs = @user.student_pairs.where(student_id: @user.id)
  pairs << student_pairs
  pairs << match_pairs
  pairs = pairs.flatten

  if @user.admin
    @pairs = @user.pairs
    @pairs_by_date = order_by_date

    render status: 200, json: {
     user: user,
     pairs: pairs,
     pairs_by_date: pairs_by_date
     }.to_json
  else
    @pairs =  pairs
    @pairs_by_date =  pairs.sort_by {|pair| pair.day}

    render status: 200, json: {
     pairs: pairs,
     pairs_by_date: pairs_by_date
     }.to_json
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
    @pair = @user.pairs.create(pair_params.merge({
      student: pair[0],
      match: pair[1]
      }))
  end
  redirect_to pairs_path, notice: "Pairs are created!"

end






  # def create
  #   students = User.all_students
  #   # render status: 200, json: students
  #
  #   new_pair = students.sample(2)
  #   # render status: 200, json: new_pair
  #
  #   student = new_pair[0]
  #   # render status: 200, json: student
  #
  #   match = new_pair[1]
  #   # render status: 200, json: match
  #
  #   pair = student.pairs.create(pair_params.merge({
  #     student: student,
  #     match: match
  #     }))
  #
  #   if pair.save
  #       render status: 201, json: {
  #         message: "Pair successfully created",
  #         pair: pair,
  #       }.to_json
  #   else
  #     render status: 422, json: {
  #       errors: pair.errors
  #     }.to_json
  #   end
  # end

  private
  def pair_params
   params.require(:pair).permit(:student_id, :match_id, :user_id, :day)
  end

  def setup_user
    @user = User.find(params[:id])
  end

  def order_by_date
    @user.pairs.order_date
  end
end
