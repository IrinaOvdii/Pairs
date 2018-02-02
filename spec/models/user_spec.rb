require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "has many association with pair" do
    let!(:user1) { create :user, name: "Irina", email: "irina@user.com", password: "123456", admin: true }
    let!(:user2) { create :user, name: "Oskar", email: "oskar@user.com", password: "123456" }
    let!(:user3) { create :user, name: "Lillian", email: "lillian@user.com", password: "123456" }
    let!(:user4) { create :user, name: "Bobby", email: "bobby@user.com", password: "123456" }

    let!(:pair1) { create :pair, student: user2, match: user3 }
    let!(:pair2) { create :pair, student: user2, match: user4 }

    it "has many pairs" do
    pair1 = user2.pairs.new(day: "2009-08-04 00:00:00")
    pair2 = user2.pairs.new(day: "2009-08-04 00:00:00")

    expect(user2.pairs).to include(pair1)
    expect(user2.pairs).to include(pair2)
  end
  end
end
