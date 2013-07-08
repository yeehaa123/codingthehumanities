class TweetFilter

  def filter_words(words)
    words = clean_words(words)
    words = remove_hyperlinks(words) 
    filter_trivial_words(words) 
  end

  private
  
  def remove_hyperlinks(words)
    words.reject { |word| word =~ /http/ }
  end

  def clean_words(words)
    clean_regex = /[\,\@\.\#]/
    words.map { |word| word.downcase.gsub(clean_regex, "") }
  end

  def filter_trivial_words(words)
    trivial_words = %w{humanities Humanities and oh know chelmsford have or is on the of for by to de RT the we how tawanan with}
    words.reject { |word| word if trivial_words.include? word }
  end
end
