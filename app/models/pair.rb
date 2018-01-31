class Pair < ApplicationRecord
  belongs_to :student, :class_name => 'User', :foreign_key  => "student_id"
  belongs_to :match, :class_name => 'User', :foreign_key  => "match_id"
  belongs_to :user

  def self.order_date
    Event.order :day
  end
end
