class Pair < ApplicationRecord

  $taken_pairs = []

  belongs_to :student, :class_name => 'User', :foreign_key  => "student_id"
  belongs_to :match, :class_name => 'User', :foreign_key  => "match_id"
  belongs_to :user

  validates :day, presence: true
  validates_each :day do |this_pair, attr, value|
    student_student_pairs = Pair.where(student: this_pair.student).to_a
    student_match_pairs = Pair.where(student: this_pair.match).to_a
    match_student_pairs = Pair.where(match: this_pair.student).to_a
    match_match_pairs = Pair.where(match: this_pair.match).to_a

    if student_student_pairs.any? {|pair| pair[:day] == value}
     this_pair.errors.add(attr, 'Students cannot have two pairs per day')
    elsif student_match_pairs.any? {|pair| pair[:day] == value}
     this_pair.errors.add(attr, 'Students cannot have two pairs per day')
    elsif match_student_pairs.any? {|pair| pair[:day] == value}
     this_pair.errors.add(attr, 'Students cannot have two pairs per day')
    elsif match_match_pairs.any? {|pair| pair[:day] == value}
     this_pair.errors.add(attr, 'Students cannot have two pairs per day')
    end
  end

  def self.order_date
    Pair.order :day
  end
end
