source 'https://rubygems.org'
ruby '~> 2.7.3'

# application server
gem 'rails', '~> 5.2'

# database
gem 'pg'

# web server
gem 'puma'
# gem 'rack-timeout'

# Reduces boot times through caching
gem 'bootsnap'

# assets: css / js
gem 'autoprefixer-rails'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'mimemagic'
gem 'sassc-rails'
gem 'uglifier'

# auth
gem 'bcrypt'
gem 'omniauth'
gem 'omniauth-twitter'

# pagination
gem 'will_paginate'

# auto-linking @usernames and #hashtags
gem 'twitter-text'

# activities units conversion
gem 'ruby-units'

# syndication
gem 'twitter'

# testing
group :development, :test do
  # code style guide and linting
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'

  gem 'capybara'
  gem 'codeclimate-test-reporter', require: false
  gem 'factory_bot_rails'
  gem 'listen'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen'
  gem 'webdrivers'
end

# development only
group :development do
  gem 'byebug'
  gem 'grailbird_updater'
  gem 'overcommit'
  gem 'pry'
  gem 'web-console'

  # For measuring page/code performance
  gem 'rack-mini-profiler'

  # For memory profiling
  gem 'memory_profiler'

  # For call-stack profiling flamegraphs
  gem 'fast_stack'
  gem 'flamegraph'
  gem 'stackprof'
end

# windows dev
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
