class TweetFilter
  def filter_words(words)
    trivial_words = %w{humanities Humanities and oh know chelmsford have or is on the of for by to de RT the we how tawanan with}
    words.map! { |word| word.downcase.gsub(/[\,|\@|\.|\#]/, "") }
    words.reject! { |word| word =~ /http/ }
    words.reject { |word| word if trivial_words.include? word }
  end
end
