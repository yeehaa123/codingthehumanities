require 'twitter'
require 'forwardable'

require_relative '../config/twitter_config'
require_relative 'tweet_filter'
require_relative 'tweet_ranker'
require_relative 'tweet_parser'

class TweetVault

  extend Forwardable

  attr_reader :tweets, :filter, :ranker
  
  def_delegator :filter, :filter_words
  def_delegator :ranker, :rank_tweeters
  def_delegator :ranker, :rank_concepts

  def initialize
    @tweets ||= TweetParser.new.add_tweets
    @filter ||= TweetFilter.new
    @ranker ||= TweetRanker.new
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
