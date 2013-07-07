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

  describe "#rank_tweeters" do
    it "should return the most popular authors" do
      vault.rank_tweeters(tweets).size.must_equal 8
    end 

    it "should have Ar_Arrr with 2 tweets as the first tweeter" do
      vault.rank_tweeters(tweets).first[0].must_equal "Ar_Arrr"
      vault.rank_tweeters(tweets).first[1].must_equal 2
    end

    it "should have TLTP with 10 tweets as the last tweeter" do
      vault.rank_tweeters(tweets).last[0].must_equal "TLTP"
      vault.rank_tweeters(tweets).last[1].must_equal 7
    end
  end

  describe "#ranked_concepts" do
    it "should return 10 concepts" do
      vault.rank_concepts(all_words).size.must_equal 10
    end
    
    it "should have much with 2 tweets as the first concept" do
      vault.rank_concepts(all_words).first[0].must_equal "physics" 
      vault.rank_concepts(all_words).first[1].must_equal 2 
    end

    it "should have new with 2 tweets as the last concept" do
      vault.rank_concepts(all_words).last[0].must_equal "white" 
      vault.rank_concepts(all_words).last[1].must_equal 2 
    end
  end

  describe "#all_words" do
    it "should return ? words" do
      all_words.size.must_equal 974
    end
  end

  describe "#filter_words" do
    it "should not include trivial words" do
      vault.filter_words(all_words).wont_include "and"
      vault.filter_words(all_words).wont_include "or"
      vault.filter_words(all_words).wont_include "is"
    end
  end
end

describe TweetFilter do
end
