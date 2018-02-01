require 'rails_helper'

describe "Current user viewing the list of pairs" do
  before { login_as student_user }

  let!(:student_user) { create :user, name: "Irina", email: "irina@user.com", password: "123456" }
  let!(:match_user) { create :user, name: "Oskar", email: "oskar@user.com", password: "123456" }
  let!(:pair) { create :pair, student: student_user, match: match_user }

  it "shows his pairs" do
    pair1 = student_user.pairs.build(student: student_user, match: match_user, day: "2009-08-04 00:00:00")
    visit pairs_url
    expect(page).to have_text("Irina")
  end
end
