source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.5"

gem "rails", "~> 7.0.2", ">= 7.0.2.3"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'redis', '~> 4.6'
gem 'sidekiq', '~> 6.4', '>= 6.4.2'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'database_cleaner', '~> 1.8', '>= 1.8.5'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'ffaker', '~> 2.17'
  gem 'rspec-rails', '~> 4.0', '>= 4.0.2'
  gem 'shoulda-matchers', '~> 4.5'
  gem 'simplecov', '~> 0.21.2', require: false
end

group :development do
  gem "spring"
end

