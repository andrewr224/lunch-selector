source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'

gem 'cancancan'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'devise_token_auth'
gem 'draper'
gem 'foundation-rails'
gem 'haml-rails'
gem 'hamlit'
gem 'jbuilder', '~> 2.5'
gem 'puma', '~> 3.7'
gem 'reform'
gem 'reform-rails'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'capybara', '~> 2.13'
  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'pry'
  gem 'rspec-rails', '~> 3.6'
  gem 'selenium-webdriver'
  gem 'sqlite3'
end

group :development do
  gem 'awesome_print'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
