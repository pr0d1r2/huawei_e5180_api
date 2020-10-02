# frozen_string_literal: true

require 'simplecov'

SimpleCov.start
SimpleCov.minimum_coverage 100
SimpleCov.refuse_coverage_drop

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'huawei_e5180_api'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].sort.each { |f| require f }

RSpec.configure do |_config|
end
