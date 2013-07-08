require 'twitter'
require 'forwardable'

require_relative '../config/twitter_config'
require_relative 'tweet_filter'
require_relative 'tweet_ranker'
require_relative 'tweet_parser'

class TweetVault

  extend Forwardable

  attr_reader :tweets, :since_id
  
  def_delegator :filter, :filter_words
  def_delegator :ranker, :rank_tweeters, :rank_concepts

  def initialize
    @query ||= parser.add_tweets
  end
  
  def tweets
    @tweets   ||= @query[0]
  end

  def since_id
    @since_id ||= @query[1]
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

  def tweeters
    tweets.map { |tweet| tweet.user.screen_name }
  end

  def tweet_texts
    tweets.map {|tweet| tweet.text }
  end
  
  def all_words
    words = []
    tweet_texts.each { |tweet| words << tweet.split(" ") }
    words = words.flatten
    filter_words(words)
  end
end
