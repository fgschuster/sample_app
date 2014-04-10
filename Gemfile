source 'https://rubygems.org'
# Major pain to make this run on HeRoKu...

# ruby version stays at 1.9.3 vs. no version declaration 
# in "Advanced Configuration" Gemfile
ruby '1.9.3'
#runy-gemset=railstutorial_rails_4_0

# leaving the rails version unchanged from the first_app Gemfile
gem 'rails', '4.0.4'

# used lines 11 to 16 gems from first-app Gemfile
gem 'sass-rails', '4.0.1'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.1'
gem 'jquery-rails', '3.0.4'
gem 'turbolinks', '1.1.1'
gem 'jbuilder', '1.0.2'

# adding the "Advanced Configuration" Gemfile 
# from https://raw.github.com/railstutorial/sample_app_2nd_ed/master/Gemfile
gem 'bootstrap-sass', '2.1'
gem 'bcrypt-ruby', '3.0.1'
gem 'faker', '1.0.1'
gem 'will_paginate', '3.0.3'
gem 'bootstrap-will_paginate', '0.0.6'

group :development, :test do
 # used sqlite3 v from first-app Gemfile
  gem 'sqlite3', '1.3.8'
  gem 'rspec-rails', '2.13.1'
  gem 'guard-rspec', '2.5.0'
  gem 'spork-rails', '4.0.0'
  gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.3.6'
  # gem 'spork', '1.0.0'
end

group :test do
  gem 'selenium-webdriver', '2.39.0'
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails', '4.1.0'
  gem 'cucumber-rails', '1.2.1', :require => false
  gem 'database_cleaner', '0.7.0'
  # gem 'launchy', '2.1.0'
  # gem 'rb-fsevent', '0.9.1', :require => false
  # gem 'growl', '1.0.3'

  # Uncomment these lines for Windows:
  gem 'rb-notifu', '0.0.4'
  gem 'win32console', '1.3.2'
  gem 'wdm', '0.1.0'
end

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

# production remains also unchanged from the first_app Gemfile
group :production do
	gem 'pg', '0.15.1'
	gem 'rails_12factor', '0.0.2'
end
