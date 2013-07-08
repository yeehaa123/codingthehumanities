require 'spec_helper'

describe TweetParser do
  let(:parser)            { TweetParser.new.add_tweets }
  let(:tweets)            { parser[0] }
  let(:since_id)          { parser[1] }

  before do
    VCR.insert_cassette 'twitter-humanities'
  end

  after do
    VCR.eject_cassette
  end

  describe "#tweets" do
    it "should return all elements" do
      tweets.size.must_equal 100
    end
  end
  
  describe "#since_id" do
    it "should store the since_id" do
      since_id.must_be :>=, 0
    end
  end
end
