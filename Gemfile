source :rubygems

gem 'padrino'
gem 'rake'
gem 'rack-flash'
gem 'thin'

gem 'data_mapper'
gem 'haml'
gem 'shout-bot', :git => 'git://github.com/hsbt/shout-bot.git'
gem 'nokogiri'
gem 'bitly'

group :test do
	gem 'rspec'
	gem 'rr'
	gem 'rack-test', :require => 'rack/test'
	gem 'fuubar'
end

group :development do
	gem 'dm-sqlite-adapter', :group => :test
	gem 'heroku'
end

group :production do
	gem 'dm-postgres-adapter'
end
