require 'spec_helper'

describe TweetVault do
  let(:vault) { TweetVault.new } 

  before do
    VCR.insert_cassette 'twitter-humanities'
  end

  after do
    VCR.eject_cassette
  end

  describe "#tweeters" do
    it "should return the 10 most active tweeters" do
      vault.tweeters.size.must_equal 10
    end
  end

  describe "#concepts" do
    it "should return the 10 most tweeted concepts" do
      vault.concepts.size.must_equal 10
    end
  end
end
