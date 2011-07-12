source 'http://rubygems.org'

gem 'rails', '3.1.0.rc4'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# gem 'sqlite3'
gem 'pg'

# Asset template engines
gem 'sass-rails', "~> 3.1.0.rc"
gem 'coffee-script'
gem 'uglifier'

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
	gem 'turn', :require => false
  gem 'capybara', :git => 'git://github.com/jnicklas/capybara.git'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
	gem 'launchy'
	gem 'database_cleaner'
end

group :production do
  gem 'therubyracer-heroku', :git => 'git://github.com/aler/therubyracer-heroku.git'
end

gem 'devise'
gem 'cancan'