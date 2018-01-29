require 'rails_helper'

RSpec.describe Pair, type: :model do
  describe "association with pair" do
    let(:student_user) { create :user, email: "student@user.com" }
    let(:match_user) { create :user, email: "match@user.com" }

    let!(:pair) { create :pair, match: match_user, student: student_user }

    it "has students" do
      expect(pair.students).to include(student_user)
    end
  end
end
