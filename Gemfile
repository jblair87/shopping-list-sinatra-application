source 'http://rubygems.org'
git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"
ruby '~> 2.6.1'

gem 'activerecord', :require => 'active_record'
gem 'pry-nav'
gem 'require_all'
gem 'sinatra'
gem 'sinatra-flash'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'thin'
gem 'bcrypt'
gem 'rack-flash3'
gem "rack", ">= 2.0.8"



group :development, :production do
  gem 'rake'
end



group :development do
  gem 'shotgun'
  gem 'tux'
end

group :development, :test do
  gem 'pry'
  gem 'sqlite3'
end


group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner'
end
