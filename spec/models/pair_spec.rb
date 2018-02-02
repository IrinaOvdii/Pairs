require 'rails_helper'

RSpec.describe Pair, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:day) }
  end

  describe "association with user" do
    let!(:student_user) { create :user, name: "Irina", email: "irina@user.com", password: "123456" }
    let!(:match_user) { create :user, name: "Oskar", email: "oskar@user.com", password: "123456" }
    let!(:pair1) { create :pair, student: student_user, match: match_user, day: "2011-08-04 00:00:00" }
    let!(:pair2) { create :pair, student: student_user, match: match_user, day: "2009-08-04 00:00:00" }

    it "belongs to student" do
      expect(pair1.student).to eq(student_user)
    end

    it "belongs to match" do
      expect(pair2.match).to eq(match_user)
    end
  end

  describe ".order_date" do
    let!(:student_user) { create :user, name: "Irina", email: "irina@user.com", password: "123456" }
    let!(:match_user) { create :user, name: "Oskar", email: "oskar@user.com", password: "123456" }
    let!(:pair1) { create :pair, student: student_user, match: match_user, day: "2011-08-04 00:00:00" }
    let!(:pair2) { create :pair, student: student_user, match: match_user, day: "2009-08-04 00:00:00" }

    it "returns a sorted array of pairs by day" do

      expect(Pair.order_date).to eq([pair2, pair1])
    end
  end
end
