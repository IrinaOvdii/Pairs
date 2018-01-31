class PairsSerializer < ActiveModel::Serializer
  attributes :id, :day, :student_id, :match_id, :user_id

  belongs_to :student, :class_name => 'User', :foreign_key  => "student_id"
  belongs_to :match, :class_name => 'User', :foreign_key  => "match_id"
  belongs_to :user
end
