class Api::PairsController < ApplicationController
  def index
    if current_user.admin
      render status: 200, json: {
        pairs: Pair.all
      }.to_json
    elsif current_user.match_pairs.count > 0
      render status: 200, json: {
        pairs: current_user.match_pairs
      }.to_json
    else
      render status: 200, json: {
        pairs: current_user.student_pairs
      }.to_json
    end
  end







end
