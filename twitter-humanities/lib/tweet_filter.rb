class TweetFilter

  def filter_words(words)
    words = remove_hyperlinks(words) 
    words = remove_tweeters(words)
    words = clean_words(words)
    filter_trivial_words(words) 
  end

  private

  def remove_tweeters(words)
    words.reject { |word| word =~ /[\@]/ }
  end
  
  def remove_hyperlinks(words)
    words.reject { |word| word =~ /http/ }
  end

  def clean_words(words)
    clean_regex = /[\/\"\,\@\.\#\:]/
    words.map! { |word| word.downcase.gsub(clean_regex, "") }
    words.reject { |word| word if word == "" }
  end

  def filter_trivial_words(words)
    trivial_words = %w{humanities Humanities and oh know chelmsford have or is on the of for by to de RT the we how tawanan with yay zemon you what was saying}
    words.reject { |word| word if trivial_words.include? word }
  end
end
