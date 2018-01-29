require 'rails_helper'

RSpec.describe User, type: :model do

  describe "association with pair" do
    let(:student_user) { create :user, email: "student@user.com" }
    let(:match_user) { create :user, email: "match@user.com" }

    let!(:pair) { create :pair, student: student_user, match: match_user }

    it "has pairs" do
      expect(student_user.match_pairs).to include(match)
    end
  end

end
