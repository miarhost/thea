source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap', '4.0.0'
gem 'rails', '~> 5.1.6'


gem 'sass-rails', '~> 5.0'

gem 'puma', '~> 3.7'

gem 'uglifier', '>= 1.3.0'

gem 'jquery'
gem 'jquery-rails', '~> 4.3.1'
gem 'jquery-ui-rails'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'

gem 'jbuilder', '~> 2.5'

gem 'devise'
gem 'mini_magick'
gem 'aws-sdk-s3', '~> 1.9', '>= 1.9.1'
gem 'fog-aws', '~> 2.0'
gem 'carrierwave', '~> 0.11.2'
gem 'bcrypt', '~> 3.1.7'
gem 'figaro', '~> 1.1', '>= 1.1.1'

group :development, :test do
 
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'foreman'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
end

group :development do
 
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg', '~> 0.21.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
