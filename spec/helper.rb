require "simplecov"
SimpleCov.start

require "reach-api"

require "rspec"
require "webmock/rspec"
require "vcr"

VCR.config do |config|
  config.cassette_library_dir     = "spec/fixtures/cassettes"
  config.stub_with                :webmock
  config.ignore_localhost         = true
  config.default_cassette_options = {:record => :new_episodes}
end

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
end
