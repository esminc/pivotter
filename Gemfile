source :rubygems

gem 'padrino'
gem 'rake'
gem 'rack-flash'
gem 'crack', '0.1.6'
gem 'thin'
gem 'haml'
gem 'data_mapper'
gem 'shout-bot', :git => 'git://github.com/hsbt/shout-bot.git'
gem 'nokogiri'
gem 'bitly'

group :development do
	gem 'dm-sqlite-adapter'
end

group :production do
	gem 'dm-postgres-adapter'
end

group :test do
	gem 'dm-sqlite-adapter'
	gem 'rr'
	gem 'rspec', :require => 'spec'
	gem 'rack-test', :require => 'rack/test'
end
