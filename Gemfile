if RUBY_VERSION =~ /1.9.3/ # assuming you're running Ruby ~1.9
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use sqlite3 as the database for Active Record
# group :development, :testing do
# 	gem 'sqlite3'
# end

group :staging, :production do
	gem 'mysql2'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

gem 'sprockets-rails', :require => 'sprockets/railtie'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

gem "remotipart"

gem "rails-alertify"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'


group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
gem 'capistrano', group: :development
gem 'capistrano-ext'

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'devise', github: 'plataformatec/devise'
gem 'carrierwave'
gem 'mini_magick'

gem 'kaminari'

gem 'thin'
gem 'quiet_assets'

#gem 'humanizer'
gem "recaptcha", :require => "recaptcha/rails"

gem 'therubyracer'
gem 'execjs'