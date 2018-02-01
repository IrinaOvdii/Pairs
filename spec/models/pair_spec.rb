require 'rails_helper'

RSpec.describe Pair, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:day) }
  end

  describe "association with user" do
    let!(:student_user) { create :user, name: "Irina", email: "irina@user.com", password: "123456" }
    let!(:match_user) { create :user, name: "Oskar", email: "oskar@user.com", password: "123456" }
    let!(:pair) { create :pair, student: student_user, match: match_user }

    it "belongs to student" do
      pair1 = student_user.pairs.build(student: student_user, match: match_user, day: "2009-08-04 00:00:00")
      expect(pair1.student).to eq(student_user)
    end

    it "belongs to match" do
      pair2 = match_user.pairs.build(student: student_user, match: match_user, day: "2009-08-04 00:00:00")
      expect(pair2.match).to eq(match_user)
    end
  end
end
