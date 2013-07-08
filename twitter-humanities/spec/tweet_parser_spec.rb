require 'spec_helper'

describe TweetParser do
  let(:parser)    { TweetParser.new }
  let(:tweets)    { parser.add_tweets[0] }
  let(:since_id)  { parser.add_tweets[1] }

  before do
    VCR.insert_cassette 'twitter-humanities'
  end

  after do
    VCR.eject_cassette
  end

  describe "#add_tweets" do

    it "should return all elements" do
      parser.add_tweets[0].size.must_equal 99
    end
  
    it "should store the since_id" do
      parser.add_tweets[1].must_be :>=, 0
    end
  end

  describe "#more_tweets" do
    before do
      parser.add_tweets
    end
    
    it "should return all elements" do
      parser.add_tweets[0].size.must_equal 100
    end

    it "should have a different since_id" do
      parser.add_tweets[1].wont_equal since_id
    end
  end

  describe "#populate" do
    it "should return all elements" do
      parser.populate.uniq.size.must_equal 628
    end
  end
end
