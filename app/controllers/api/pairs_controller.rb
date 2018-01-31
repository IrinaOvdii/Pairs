class Api::PairsController < ApplicationController
before_action :setup_user
# skip_before_action :verify_authenticity_token
# protect_from_forgery with: :null_session


  def index
    if @user.admin
      render status: 200, json: {
        pairs: Pair.all
      }.to_json
    elsif @user.match_pairs.count > 0
      render status: 200, json: {
        pairs: @user.match_pairs
      }.to_json
    else
      render status: 200, json: {
        pairs: @user.student_pairs
      }.to_json
    end
  end

  def show
    pair = Pair.find(params[:id])

    render status: 200, json: {
      pair: pair
    }.to_json
  end

  def new
    pair = Pair.new
  end

  def create
    students = User.all_students
    # render status: 200, json: students

    new_pair = students.sample(2)
    # render status: 200, json: new_pair

    student = new_pair[0]
    # render status: 200, json: student

    match = new_pair[1]
    # render status: 200, json: match

    pair = student.pairs.create(pair_params.merge({
      student: student,
      match: match
      }))

    if pair.save
        render status: 201, json: {
          message: "Pair successfully created",
          pair: pair,
        }.to_json
    else
      render status: 422, json: {
        errors: pair.errors
      }.to_json
    end
  end

  private
  def pair_params
     params.require(:pair).permit(:student_id, :match_id, :user_id, :day)
  end

  def setup_user
    @user = User.find(params[:user_id])
  end
end
