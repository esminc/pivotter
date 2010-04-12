PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

Spec::Runner.configure do |conf|
  conf.mock_with :rr
  conf.include Rack::Test::Methods
end

def app
  ##
  # You can hanlde all padrino applications using instead:
  #   Padrino.application
  Pivotter.tap { |app|  }
end
