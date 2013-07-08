require 'spec_helper'

describe TweetVault do
  let(:number_of_tweets)  { 100 }
  let(:vault)             { TweetVault.new }
  let(:tweets)            { vault.tweets }
  let(:tweeters)          { vault.tweeters }
  let(:tweet_texts)       { vault.tweet_texts }
  let(:all_words)         { vault.all_words }

  before do
    VCR.insert_cassette 'twitter-humanities'
  end

  after do
    VCR.eject_cassette
  end

  describe "#tweets" do
    it "should return all elements" do
      tweets.size.must_equal number_of_tweets
    end
  end
  
  describe "#since_id" do
    it "should store the since_id" do
      vault.since_id.must_be :>=, 0
    end
  end

  describe "#tweeters" do
    it "should return the authors" do
      tweeters.size.must_equal number_of_tweets
    end
  end

  describe "#tweet_texts" do
    it "should return the texts of the 5 latest elements" do
      tweet_texts.size.must_equal number_of_tweets
    end
  end

  describe "#all_words" do
    it "should return ? words" do
      all_words.size.must_equal 974
    end
  end
end
