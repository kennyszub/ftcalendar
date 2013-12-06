source 'https://rubygems.org'

gem 'rails', '3.2.14'
gem 'haml-rails'
gem 'bootstrap-sass'
gem 'client_side_validations'


# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
group :development, :test do
  gem 'sqlite3'
  gem 'debugger'
  #gem 'cucumber-rails'
  #gem 'cucumber-rails-training-wheels'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'simplecov'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
end

gem "email_spec", ">= 1.4.0", :group => :test
gem "factory_girl_rails", :group => [:development, :test]

group :development do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end

gem 'bcrypt-ruby', :require => 'bcrypt'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery_datepicker'
gem 'geocoder'
gem 'devise'

gem 'sunspot_rails'
gem 'sunspot_solr'

gem 'validates_timeliness', '~> 3.0'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
