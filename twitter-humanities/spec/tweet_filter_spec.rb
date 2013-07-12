require 'spec_helper'

describe TweetFilter do
  
  let(:filter) { TweetFilter.new }
  
  it "should filter out tweeters" do
    tweets = "Hey @to%maama, let's go to @dgjshg tomorrow".split(/\s+/)
    filter.filter_words(tweets).wont_include "@to%maama"
    filter.filter_words(tweets).wont_include "@dgjshg"
    filter.filter_words(tweets).must_include "tomorrow"
  end

  it "should clean up words" do
    dirty_words = %w{@bla bla, bla. /bla bla#}
    filter.filter_words(dirty_words).must_include "bla"
    filter.filter_words(dirty_words).wont_include "@bla"
    filter.filter_words(dirty_words).wont_include "bla,"
    filter.filter_words(dirty_words).wont_include "bla."
    filter.filter_words(dirty_words).wont_include "bla#"
    filter.filter_words(dirty_words).wont_include "/bla"
  end

  it "should remove hyperlinks" do
    links_words = %w{bla http://www.example.org bli}
    filter.filter_words(links_words).must_include "bla"
    filter.filter_words(links_words).must_include "bli"
    filter.filter_words(links_words).wont_include "http://www.example.org"
  end

  it "should filter out trivial words" do
    trivial_words = %w{science and oh}
    filter.filter_words(trivial_words).must_include "science"
    filter.filter_words(trivial_words).wont_include "and"
    filter.filter_words(trivial_words).wont_include "oh"
  end
end
