require 'sinatra'
require_relative './lib/tweet_vault'

get '/' do
  name = TweetVault.new.tweeters[1][0]
  number = TweetVault.new.tweeters[1][1]
  "#{name}: #{number}"
end
