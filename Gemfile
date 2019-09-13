source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2'

gem 'active_type'
gem 'assignable_values'
gem 'bootsnap'
gem 'carrierwave'
gem 'coffee-rails'
gem 'consul'
gem 'devise'
gem 'haml'
gem 'has_defaults'
gem 'listen'
gem 'mini_magick'
gem 'modularity', '>=2'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'redis'
gem 'sass-rails', '~> 5.0'
gem 'sidekiq'
gem 'tod'
# gem 'uglifier', '>= 1.3.0'
gem 'unpoly-rails'
gem 'whenever'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capistrano', require: false
  # gem 'capistrano-opscomplete'
  gem 'capistrano-passenger', require: false
  gem 'capistrano-rails'
  gem 'capistrano-sidekiq'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
end
