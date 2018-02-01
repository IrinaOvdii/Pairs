require 'rails_helper'

RSpec.describe Pair, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:day) }
  end

  describe "association with pair" do
    let(:student_user) { create :user, name: "Irina", email: "student@user.com" }
    let(:match_user) { create :user, name: "Oskar", email: "match@user.com" }

    let!(:pair) { create :pair, match: match_user, student: student_user }

    it "has students" do
      expect(pair.students).to include(student_user)
    end
  end
end
