class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :student_pairs, :class_name => 'Pair', :foreign_key => 'student_id'
  has_many :match_pairs, :class_name => 'Pair', :foreign_key => 'match_id'

  #has_many :students, through: :pairs, source: :user
  #has_many :matches, through: :pairs, source: :user
end
