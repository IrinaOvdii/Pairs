FactoryBot.define do
  factory :profile do
    email    { Faker::Internet.email }
    # name  { Faker::Name.name }
  end
end
