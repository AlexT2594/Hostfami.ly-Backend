source 'https://rubygems.org'
ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets

# Process manager for applications with multiple components
gem 'foreman', '~> 0.82.0'

gem 'jwt'

gem 'bcrypt'

gem 'mailgun-ruby', '~>1.0.2', require: 'mailgun'

gem 'city-state'

gem 'rack-cors'

#Api gems
gem 'active_model_serializers'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :test do
  gem "rspec-rails", "~> 3.5"
  gem "factory_girl_rails"
  gem 'faker'
  gem "shoulda-matchers", git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
  gem 'database_cleaner' #so that after every test database is cleaned
end

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  # Use postgres as the database for Active Record
  gem 'pg'
end
