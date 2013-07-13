require 'sinatra'
require_relative './lib/tweet_vault'

get '/api/concepts' do
  content_type :json
  TweetVault.new.concepts.to_json
end

get '/api/tweeters' do
  content_type :json
  TweetVault.new.tweeters.to_json
end
