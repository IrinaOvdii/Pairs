require 'rails_helper'

describe "shared/_navbar.html.erb" do
  before { sign_in user }

  context "without profile" do
    let(:user) { create :user, name: "Filipe" }

    it "renders email" do
      render
      expect(rendered).to have_content user.email
    end
  end
end
