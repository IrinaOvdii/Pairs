require 'rails_helper'

<<<<<<< HEAD:spec/models/user_spec.rb
RSpec.describe User, type: :model do

  describe "association with pair" do
    let(:student_user) { create :user, email: "student@user.com", password: "123456" }
    let(:match_user) { create :user, email: "match@user.com", password: "123456" }

    let!(:pair) { create :pair, student: student_user, match: match_user }

    it "has pairs" do
      expect(student_user.match_pairs).to include(match)
    end
  end

=======
RSpec.describe "page/home.html.erb", type: :view do
  pending "add some examples to (or delete) #{__FILE__}"
>>>>>>> 970d5d239932b94b365a4dcfc7348145af658fc9:spec/views/pages/home.html.erb_spec.rb
end
