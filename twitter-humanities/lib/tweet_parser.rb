require 'twitter'

class TweetParser
  attr_reader :tweets

  def initialize(population_size)
    @since_id ||= 1 
    populate(population_size)
  end

  def tweeters
    @tweeters ||= []
  end

  def tweets
    @tweets ||= []
  end

  def words
    words = []
    tweets.each { |tweet| words << tweet.split(/\s+/) }
    words = words.flatten
    filter.filter_words(words)
  end

  private

  def populate(population_size)
    loop do
      add_tweets
      break tweets if tweets.size >= population_size
    end
  end

  def tweet_texts(tweets)
    tweets.map {|tweet| tweet.text }
  end

  def tweet_authors(tweets)
    tweets.map {|tweet| tweet.user.screen_name }
  end

  def add_tweets
    if @since_id == 1
      query = Twitter.search("#humanities", count: 100, result_type: "recent")
    else
     query = Twitter.search("#humanities", count: 100, max_id: @since_id, result_type: "recent")
    end
    tweets.concat(tweet_texts(query.results))
    tweeters.concat(tweet_authors(query.results))
    @since_id = query.results.last.id 
  end

  def filter
    TweetFilter.new
  end
end
