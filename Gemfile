source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '4.1.4'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc

# server
gem 'unicorn'

# auth
gem 'devise'
gem 'omniauth-jawbone'
gem 'omniauth-twitter'

# external services
gem 'twitter'
gem 'aws-sdk'

# settings
gem 'figaro'

# view
gem "haml-rails"
gem 'bootstrap-sass'
gem 'font-awesome-rails'

# log
gem 'awesome_print'
gem 'tapp'

group :development do
  gem 'sqlite3'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'letter_opener'
end

group :test, :development do
  gem 'spring'
  gem 'rspec-rails'
end

group :production do
  gem 'rails_12factor'
  gem 'pg'
end
