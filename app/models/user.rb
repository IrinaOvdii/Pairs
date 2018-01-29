class User < ApplicationRecord

  #@pairs = []

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :student_pairs, :class_name => 'Pair', :foreign_key => 'student_id'
  has_many :match_pairs, :class_name => 'Pair', :foreign_key => 'match_id'

  has_many :users, through: :match_pairs, source: :student
  has_many :users, through: :student_pairs, source: :match

  # def add_pairs
  #   pairs << match_pairs
  #   pairs << student_pairs
  # end
  #
  # def make_admin
  #   admin = true
  # end

end
