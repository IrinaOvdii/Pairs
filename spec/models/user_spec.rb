require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "association with pair" do
    let(:student_user) { create :user, name: "Irina", email: "student@user.com", password: "123456" }
    let(:match_user) { create :user, name: "Oskar", email: "match@user.com", password: "123456" }

    let!(:pair) { create :pair, student: student_user, match: match_user }

    # it "has pairs" do
      # expect(pair.match).to include(match_user)
      # expect(pair.student).to include(student_user)
      # expect(student_user.match_pairs).to include(match)
    end
  end

end
