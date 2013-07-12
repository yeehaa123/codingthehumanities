require 'twitter'
require 'forwardable'

require_relative '../config/twitter_config'
require_relative 'tweet_filter'
require_relative 'tweet_ranker'
require_relative 'tweet_parser'

class TweetVault
  
  extend Forwardable
  
  def_delegator :parser, :all_words

  def tweeters
    ranker.rank_tweeters(unranked_tweeters)
  end
  
  def concepts
    ranker.rank_concepts(all_words)
  end

  private
  
  def unranked_tweeters
    parser.tweeters
  end

  def all_words
    parser.words
  end

  def parser
    @parser ||= TweetParser.new(100)
  end

  def ranker
    @ranker ||= TweetRanker.new
  end
end
