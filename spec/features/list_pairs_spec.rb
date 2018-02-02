require 'rails_helper'

describe "Current student viewing the list of pairs" do
  before { login_as student_user }

  let!(:student_user) { create :user, name: "Irina", email: "irina@user.com", password: "123456" }
  let!(:match_user) { create :user, name: "Oskar", email: "oskar@user.com", password: "123456" }
  let!(:pair) { create :pair, student: student_user, match: match_user, day: "2010-08-04 00:00:00" }

  it "shows his pairs" do
    visit pairs_url
    expect(page).to have_text("Irina")
  end
end
