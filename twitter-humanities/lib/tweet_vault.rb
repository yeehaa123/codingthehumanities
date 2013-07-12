require 'twitter'

require_relative '../config/twitter_config'
require_relative 'tweet_filter'
require_relative 'tweet_ranker'
require_relative 'tweet_parser'

class TweetVault
  
  def initialize(amount_of_tweets = 100)
    @parser ||= TweetParser.new(amount_of_tweets)
    @ranker ||= TweetRanker.new
  end

  def tweeters
    @ranker.rank_tweeters(unranked_tweeters)
  end
  
  def concepts
    @ranker.rank_concepts(words)
  end

  private
  
  def unranked_tweeters
    @parser.tweeters
  end

  def words
    @parser.words
  end
end
