require 'twitter'
require 'forwardable'

require_relative '../config/twitter_config'
require_relative 'tweet_filter'
require_relative 'tweet_ranker'
require_relative 'tweet_parser'

class TweetVault

  extend Forwardable
  
  def initialize
  end
  
  def tweeters
    ranker.rank_tweeters(tweets)
  end
  
  def concepts
    ranker.rank_concepts(all_words)
  end

  private

  def query
    @query ||= parser.add_tweets
  end

  def tweets
    @tweets   ||= parser.populate
  end

  def tweet_texts
    tweets.map {|tweet| tweet.text }
  end

  def parser
    @parser   ||= TweetParser.new
  end

  def filter
    @filter   ||= TweetFilter.new
  end

  def ranker
    @ranker   ||= TweetRanker.new
  end

  def all_words
    words = []
    tweet_texts.each { |tweet| words << tweet.split(" ") }
    words = words.flatten
    filter.filter_words(words)
  end
end
