require 'minitest/spec'
require 'minitest/autorun'
require 'vcr'
require 'webmock/minitest'

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
end

require_relative '../lib/twitter-the-humanities.rb'
