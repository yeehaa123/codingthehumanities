class TweetParser
  def add_tweets
    Twitter.search("#humanities", count: 100, result_type: "recent").results
  end
end
