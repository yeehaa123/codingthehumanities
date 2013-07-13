require 'minitest/spec'
require 'minitest/autorun'
require 'vcr'
require 'webmock/minitest'

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.default_cassette_options = { :record => :none }
end

require_relative '../lib/tweet_vault'
