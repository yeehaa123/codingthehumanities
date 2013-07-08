require 'spec_helper'

describe TweetRanker do
  let(:vault)     { TweetVault.new }
  let(:tweets)    { vault.tweets }
  let(:all_words) { vault.all_words } 

  before do
    VCR.insert_cassette 'twitter-humanities'
  end

  after do
    VCR.eject_cassette
  end

  describe "#rank_tweeters" do

    let(:ranker) { TweetRanker.new.rank_tweeters(tweets) }

    it "should return the most popular authors" do
      ranker.size.must_equal 8
    end 

    it "should have Ar_Arrr with 2 tweets as the first tweeter" do
      ranker.first[0].must_equal "Ar_Arrr"
      ranker.first[1].must_equal 2
    end

    it "should have TLTP with 10 tweets as the last tweeter" do
      ranker.last[0].must_equal "TLTP"
      ranker.last[1].must_equal 7
    end
  end

  describe "#ranked_concepts" do

    let(:ranker) { TweetRanker.new.rank_concepts(all_words) }

    it "should return 10 concepts" do
      ranker.size.must_equal 10
    end
    
    it "should have much with 2 tweets as the first concept" do
      ranker.first[0].must_equal "physics" 
      ranker.first[1].must_equal 2 
    end

    it "should have new with 2 tweets as the last concept" do
      ranker.last[0].must_equal "white" 
      ranker.last[1].must_equal 2 
    end
  end
end
