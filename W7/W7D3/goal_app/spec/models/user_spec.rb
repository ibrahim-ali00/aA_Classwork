# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "rails_helper"

RSpec.describe User, type: :model do
  subject(:user1) { User.create(username: "User1", password: "password") }
  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }

    it { should validate_presence_of(:password_digest) }

    it { should validate_length_of(:password).is_at_least(6) }

    describe "#session_token" do
      it "assigns a session_token if none given" do
        expect(FactoryBot.create(:user).session_token).not_to be_nil
      end
    end
  end

  describe "class and instance methods" do
    before { user1.save! }
    context "::find_by_credentials" do
      it "should return the username and password match" do
        expect(User.find_by_credentials("User1", "password")).to eq(user1)
      end

      it "should return nil if username and password don't match" do
        expect(User.find_by_credentials("User1", "passwor")).to be_nil
      end
    end
    context "#is_password?" do
      it "should return true if the password is correct" do
        expect(user1.is_password?("password")).to be true
      end

      it "should return false if the password is incorrect" do
        expect(user1.is_password?("passwor")).to be false
      end
    end
    context "#reset_session_token!" do
      let(:user) { FactoryBot.build(:user) }
      it "should reset session token" do
        old_session_token = user.session_token
        expect(user.reset_session_token!).not_to eq(old_session_token)
      end
    end
  end
end
