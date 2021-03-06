source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'activeadmin', git: 'https://github.com/activeadmin/activeadmin'
gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap-sass'
gem 'carrierwave', '~> 1.0'
gem 'ckeditor'
gem 'cocoon'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'faker'
gem 'font-awesome-rails'
gem 'friendly_id'
gem 'haml-rails'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'jquery-ui-rails'
gem 'kaminari'
gem 'listen', '~> 3.0.5'
gem 'mini_magick'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'pundit'
gem 'rails', '~> 5.0.1'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'therubyracer', platforms: :ruby
gem 'turbolinks', '~> 5'
gem 'twitter'
gem 'twitter-text'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem "rack-livereload"
  gem 'annotate'
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
  gem 'byebug'
  gem 'capybara'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'guard', require: false
  gem 'guard-livereload', '~> 2.5'
  gem 'guard-rspec', require: false
  gem 'pry-rails'
  gem 'rb-inotify', '>= 0.8.8'
  gem 'rspec-rails', '~> 3.0'
end

group :development do
  gem 'capistrano', '~> 3.6'
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-bundler'
  gem 'capistrano-passenger'
  gem 'capistrano-rvm'
  gem 'web-console', '>= 3.3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'minitest-reporters', '1.0.5'
  gem 'mini_backtrace',     '0.1.3'
  gem 'guard-minitest',     '2.3.1'
  gem 'database_cleaner'
  gem 'formulaic'
  gem 'shoulda-matchers', require: false
  gem 'timecop'
  gem 'webmock'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
