source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'

# I18n rails translations :)
gem 'rails-i18n'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# gem 'sprockets'
# gem 'uglifier'

#
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# gem 'mysql2'
gem 'pg'

# For simple search:
gem 'ransack'

gem 'devise'
gem 'omniauth'
gem 'omniauth-google-oauth2'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.3'

gem 'leifcr-gravtastic'

# gem 'autoprefixer-rails'
gem 'bootstrap', '4.1.3'
# gem 'bootstrap-sass'
# gem 'font-awesome-sass'

# Error Tracking
gem 'sentry-raven'

# Haml power
gem 'haml'
gem 'haml-rails'

group :production, :test do
  # gem 'puma', '~> 3.0'
  gem 'passenger', '>= 5.1.0  ', require: 'phusion_passenger/rack_handler'
end

gem 'simple_form', '~> 4.0'

# gem 'mini_magick'

# gem 'carrierwave'
# gem 'carrierwave-i18n'

# pagination
gem 'kaminari'

# Inline css for emails, without the hassle:
# gem 'premailer-rails'

# For nice tables in text emails
# gem 'terminal-table'
#
# gem 'foundation_emails'
# gem 'inky-rb', require: 'inky'

# For validating email addresses
gem 'valid_email2'

gem 'slack-ruby-client'

# Prettier alerts + include confirm method for rails.confirm ujs :)
gem 'sweet-alert-confirm', github: 'mois3x/sweet-alert-rails-confirm'

# gem 'momentjs-rails'

gem 'sidekiq'
# Unique jobs in non-enterprise sidekiq :)
gem 'sidekiq-unique-jobs'

# Delayed job does not work with rails 5.1...
# gem 'delayed_job'
# gem 'delayed_job_active_record'

# gem 'wicked_pdf'
# 0.12 version for all platforms
# gem 'wkhtmltopdf-binary-edge'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

gem 'paper_trail'

# If JS gets more advanced on the intranet, change to use webpacker
gem 'webpacker'

# gem 'rest-client'
#
# gem 'json_api_client'

# # For accessing Billys billing
# gem 'httparty'

gem 'her'

# For address types and invoice states
gem 'enumerize'

gem 'skylight'

gem 'foreman'

group :development do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

  # gem 'capistrano', require: false
  # gem 'capistrano-db-tasks', require: false, github: 'leifcr/capistrano-db-tasks', tag: 'v0.4.1'
  # # gem 'capistrano-delayed_job', require: false
  # gem 'capistrano-monit_runit', require: false
  # gem 'capistrano-pumaio', require: false
  # gem 'capistrano-rails', require: false

  gem 'better_errors'
  gem 'binding_of_caller'

  # For reloading during devel
  gem 'guard-bundler', require: false
  gem 'guard-foreman' # , github: 'leifcr/guard-foreman', require: false
  gem 'guard-livereload', require: false
  # gem 'guard-rspec', require: false

  gem 'leifcr-rack-livereload', require: 'rack-livereload'

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'

  # Use thin, since it works better with better_errors and binding_of_caller (for now)
  gem 'thin'

  # Better ruby/rails console
  gem 'pry-rails'
  gem 'pry-toys'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # Spring doesn't work well with docker_data folder...
  # gem 'spring'
  # gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'listen', '~> 3.0'
end

# group :test do
#   gem 'capybara'
#   gem 'database_cleaner'
#   # gem 'leifcr-capybara-screenshot'
#   gem 'capybara-screenshot'
#   gem 'shoulda-matchers'
#   gem 'timecop'

#   # Retry if phantomjs just blows up...
#   # gem 'rspec-retry'

#   # js drivers for capybara
#   # Use phantomjs through poltergeist
#   # gem 'poltergeist'

#   gem 'capybara-selenium'
#   gem 'chromedriver-helper'

#   # Alternative: change to https://github.com/elgalu/docker-selenium
#   # For using real chrome/ff browsers through selenium

#   # Coverage
#   # gem 'simplecov', require: false
#   # gem 'simplecov-rcov', require: false

#   # Notificiations sent to growl through gntp
#   gem 'ruby_gntp'
# end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
