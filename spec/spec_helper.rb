PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.mock_with :rr
end

def app
  Padrino.application
end
