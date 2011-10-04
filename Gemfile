source :rubygems

gem 'padrino'
gem 'rake', '~> 0.8.7'
gem 'rack-flash'

gem 'data_mapper'
gem 'haml'
gem 'sass'

gem 'nokogiri'
gem 'shout-bot', :git => 'git://github.com/hsbt/shout-bot.git'
gem 'bitly'

group :test do
  gem 'rspec'
  gem 'rr'
  gem 'rack-test', :require => 'rack/test'
  gem 'fuubar'
end

group :development do
  gem 'thin'
  gem 'heroku'
  gem 'dm-sqlite-adapter', :group => :test
end

group :production do
  gem 'dm-postgres-adapter'
end
