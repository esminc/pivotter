require ::File.dirname(__FILE__) + '/config/boot.rb'

use Rack::Exceptional, ENV['EXCEPTIONAL_API_KEY']

run Padrino.application
