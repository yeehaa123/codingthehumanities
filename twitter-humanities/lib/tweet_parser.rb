class TweetParser
  def add_tweets
    query = Twitter.search("#humanities", count: 100, result_type: "recent")
    results = query.results
    since_id = query.since_id
    [results, since_id]
  end
end
