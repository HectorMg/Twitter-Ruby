require 'rails_helper'

RSpec.describe Tweet, type: :model do
  let(:tweet) { FactoryGirl.build :tweet }

  describe "associations" do
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:content).is_at_least(1)}
    it { should validate_length_of(:content).is_at_most(140)}
  end

  describe "scopes" do
    describe "default" do
      it "should return tweets ordered by created_at in descending order" do
        tweet1 = FactoryGirl.create :tweet
        tweet2 = FactoryGirl.create :tweet
        expect(Tweet.all.to_a).to eql [tweet2, tweet1]
      end
    end
  end
end
