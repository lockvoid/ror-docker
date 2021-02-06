source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'aasm', '~> 5.0.8'
gem 'ansi', '~> 1.5.0'
gem 'aws-sdk-s3', require: false # find alternative
gem 'bcrypt', '~> 3.1.13'
gem 'bootsnap', '~> 1.4.5', require: false
gem 'browser', '~> 2.6.1'
gem 'ferrum', '~> 0.9.0'
gem 'httparty', '~> 0.18.1'
gem 'image_processing', '~> 1.9.2'
gem 'jbuilder', '~> 2.10.0'
gem 'oj', '~> 3.10.2'
gem 'paper_trail', '~> 10.3.1'
gem 'pg', '~> 1.1.0'
gem 'puma', '~> 4.3.5'
gem 'pundit', '~> 2.0.1'
gem 'rails', github: 'rails/rails'
gem 'rails-i18n', '~> 6.0.0'
gem 'redis', '~> 4.2.2'
gem 'redis-namespace', '~> 1.8.0'
gem 'searchkick', '~> 4.1.1'
gem 'sidekiq', '~> 6.0.5'
gem 'sidekiq-cron', '~> 1.1.0'
gem 'turbolinks', '~> 5.2.0'
gem 'typhoeus', '~> 1.3.1'
gem 'tzinfo', '~> 2.0.2'
gem 'webpacker', '~> 4.2.2'
gem 'wicked', '~> 1.3.4'

group :development, :test do
  gem 'byebug', '~> 11.1'
  gem 'dotenv-rails', '~> 2.7'
  gem 'faker', '~> 2.6'
end

group :development do
  gem 'brakeman', '~> 4.7'
  gem 'i18n-debug', '~> 1.2'
  gem 'listen', '~> 3.1'
  gem 'spring', '~> 2.1'
  gem 'spring-watcher-listen', '~> 2.0'
  gem 'web-console', '~> 3.3'
end

group :test do
  gem 'capybara', '~> 3.31'
  gem 'guard', '~> 2.16'
  gem 'guard-minitest', '~> 2.0'
  gem 'ruby-prof', '~> 0.17'
  gem 'selenium-webdriver', '~> 3.26'
  gem 'webdrivers', '~> 4.1'
end

group :production do
  gem 'airbrake', '~> 10.0.1'
end

