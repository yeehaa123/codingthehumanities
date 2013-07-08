require 'pry'
class TweetParser

  def since_id
    @since_id ||= 1
  end

  def add_tweets
    if since_id == 1
      query = Twitter.search("#humanities", count: 100, result_type: "recent")
    else
      query = Twitter.search("#humanities", count: 100, max_id: since_id, result_type: "recent")
    end
    results = query.results
    @since_id = query.results.last.id
    [results, since_id]
  end

  def populate
    tweets = []
    15.times do
      tweets << add_tweets[0]
    end
    tweets.flatten
  end
end
