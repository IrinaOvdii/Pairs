class Pair < ApplicationRecord

  validates :day, presence: true, uniqueness: { scope: :student_id || :match_id , message: "A person can be matched only once per day" }

  $taken_pairs = []

  belongs_to :student, :class_name => 'User', :foreign_key  => "student_id"
  belongs_to :match, :class_name => 'User', :foreign_key  => "match_id"
  belongs_to :user

  validates :day, presence: true

  def self.order_date
    Pair.order :day
  end
end
