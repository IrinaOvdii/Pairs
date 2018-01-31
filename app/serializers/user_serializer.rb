class UserSerializer < ActiveModel::Serializer
  attributes :id, :pairs

  has_many :student_pairs, :class_name => 'Pair', :foreign_key => 'student_id'
  has_many :match_pairs, :class_name => 'Pair', :foreign_key => 'match_id'

  has_many :users, through: :match_pairs, source: :student
  has_many :users, through: :student_pairs, source: :match

  has_many :pairs, dependent: :destroy
end
