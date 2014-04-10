source 'https://rubygems.org'
# ruby version stays at 1.9.3 vs. no version declaration 
# in "Advanced Configuration" Gemfile
ruby '1.9.3'
#runy-gemset=railstutorial_rails_4_0

gem 'rails', '4.0.4'
# adding the "Advanced Configuration" Gemfile 
# from https://raw.github.com/railstutorial/sample_app_2nd_ed/master/Gemfile
# however leaving the rails version unchanged from the first_app Gemfile
gem 'bootstrap-sass', '2.1'
gem 'bcrypt-ruby', '3.0.1'
gem 'faker', '1.0.1'
gem 'will_paginate', '3.0.3'
gem 'bootstrap-will_paginate', '0.0.6'
# used jquery-rails v from first-app Gemfile
gem 'jquery-rails', '3.0.4'
# added jquery-rails, turbolinks & jbuilder from first-app Gemfile
gem 'jquery-rails', '3.0.4'
gem 'turbolinks', '1.1.1'
gem 'jbuilder', '1.0.2'

group :development, :test do
 # used sqlite3 v from first-app Gemfile
  gem 'sqlite3', '1.3.8'
  gem 'rspec-rails', '2.11.0'
  gem 'guard-rspec', '1.2.1'
  gem 'guard-spork', '1.2.0'
  gem 'childprocess', '0.3.6'
  gem 'spork', '0.9.2'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
# used sass-rails, coffee-rails & uglifier v from first-app Gemfile
  gem 'sass-rails',   '4.0.1'
  gem 'coffee-rails', '4.0.1'
  gem 'uglifier', '2.1.1'
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'factory_girl_rails', '4.1.0'
  gem 'cucumber-rails', '1.2.1', :require => false
  gem 'database_cleaner', '0.7.0'
  # gem 'launchy', '2.1.0'
  # gem 'rb-fsevent', '0.9.1', :require => false
  # gem 'growl', '1.0.3'
end

# production remains also unchanged from the first_app Gemfile
group :production do
	gem 'pg', '0.15.1'
	gem 'rails_12factor', '0.0.2'
end
