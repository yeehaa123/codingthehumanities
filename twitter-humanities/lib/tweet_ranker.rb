class TweetRanker

  def rank_tweeters(tweeters)
    unranked_tweeters = Hash.new(0)
    tweeters.each do |tweeter|
      unranked_tweeters[tweeter] += 1 
    end
    rank(unranked_tweeters)
  end

  def rank_concepts(words)
    concepts = Hash.new(0)
    words.each do |word|
      concepts[word] += 1
    end
    rank(concepts)
  end

  private

  def rank(rankable)
    rankable.select! {|name, count| count >= 2}
    ranked_by_name = rankable.sort_by {|name, count| name } 
    ranked_by_count = ranked_by_name.sort_by {|name, count| count }.take(10) 
  end
end
