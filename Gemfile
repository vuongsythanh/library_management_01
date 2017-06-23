source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bcrypt", "3.1.11"
gem "bootstrap-kaminari-views"
gem "bootstrap-sass", "~> 3.3.6"
gem "bootstrap_form"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "faker", "1.6.6"
gem "font-awesome-rails"
gem "font-awesome-sass", "~> 4.7.0"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "jquery-turbolinks"
gem "kaminari"
gem "puma", "~> 3.0"
gem "rails", "~> 5.0.1"
gem "sass-rails", "~> 5.0"
gem "sprockets-rails", :require => "sprockets/railtie"
gem "sweetalert2"
gem "to_xls-rails"
gem "turbolinks", "~> 5.0.0"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "mysql2", ">= 0.3.18", "< 0.5"
  gem "byebug", platform: :mri
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production do
  gem "pg", "0.18.4"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
