FactoryBot.define do
  factory :pair do
    # student_id
    # match_id
    day               {Time.now + 10.days}
    user              { build(:user) }
  end
end
