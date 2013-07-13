require 'spec_helper'

describe TweetRanker do
  let(:parser)    { TweetParser.new(100)}
  let(:tweets)    { parser.tweets}
  let(:words)     { parser.words }
  let(:tweeters)  { parser.tweeters }

  before do
    VCR.insert_cassette 'twitter-humanities'
  end

  after do
    VCR.eject_cassette
  end

  describe "#rank_tweeters" do

    let(:ranker) { TweetRanker.new.rank_tweeters(tweeters) }

    it "should return the most popular authors" do
      ranker.size.must_equal 8
    end 

    it "should have rwpickard with 2 tweets as the first tweeter" do
      ranker.first[0].must_equal "rwpickard"
      ranker.first[1].must_equal 3
    end

    it "should have GreggBrennen with 10 tweets as the last tweeter" do
      ranker.last[0].must_equal "GregBrennen"
      ranker.last[1].must_equal 2
    end
  end

  describe "#ranked_concepts" do

    let(:ranker) { TweetRanker.new.rank_concepts(words) }

    it "should return 10 concepts" do
      ranker.size.must_equal 10
    end
    
    it "should have much with 2 tweets as the first concept" do
      ranker.first[0].must_equal "national"
      ranker.first[1].must_equal 17 
    end

    it "should have new with 2 tweets as the last concept" do
      ranker.last[0].must_equal "decline" 
      ranker.last[1].must_equal 9 
    end
  end
end
