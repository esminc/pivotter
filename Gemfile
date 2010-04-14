source :rubygems

gem 'padrino', '0.9.9'
gem 'rake'
gem 'rack-flash'
gem 'thin' # or mongrel
gem 'haml'
gem 'data_objects'
gem 'do_sqlite3'
gem 'datamapper'
gem 'shout-bot', :git => 'http://github.com/hsbt/shout-bot.git'
gem 'nokogiri'

group :production do
	gem 'do_postgres'
end

group :test do
	gem 'rr'
	gem 'rspec', :require => 'spec'
	gem 'rack-test', :require => 'rack/test'
end
