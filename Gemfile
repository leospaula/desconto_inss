source "https://rubygems.org"

gem "rails", "~> 7.2.2"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "bootsnap", require: false
gem 'bootstrap', '~> 5.0'
gem 'dartsass-sprockets'
gem 'chartkick'
gem 'kaminari'
gem 'redis-rails'
gem 'sidekiq'

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 7.0.0'
  gem 'factory_bot_rails'
  gem 'pry', '~> 0.14.2'
  gem 'faker'
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
