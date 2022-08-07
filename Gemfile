source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'babosa', '~> 1.0', '>= 1.0.3'                              # Slugs
gem 'bootsnap', '>= 1.4.4', :require => false                   # Reduces boot times through caching; required in config/boot.rb
gem 'devise', '~> 4.7', '>= 4.7.2'                              # Authentication
gem 'faraday-http-cache', '~> 2.4'                              # Faraday middleware that respects HTTP cache
gem 'friendly_id', '~> 5.4.0'                                   # Human-friendly URLs
gem 'gemoji', '~> 3.0', '>= 3.0.1'                              # Emojis
gem 'git', '~> 1.11'                                            # Manipulate Git repositories
gem 'github_api', '~> 0.19.0'                                   # GitHub API
gem 'jbuilder', '~> 2.7'                                        # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jquery-rails', '~> 4.4'                                    # Require jquery & jquert_ujs
gem 'kaminari', '~> 1.2.1'                                      # Pagination
gem 'kaminari-i18n', '~> 0.5.0'                                 # Pagination i18n
gem 'mysql2', '~> 0.5'                                          # Use mysql as the database for Active Record
gem 'peek', '~> 1.1'                                            # Profiler
gem 'peek-git', '~> 1.0', '>= 1.0.2'                            # Peek integration with git
gem 'peek-mysql2', '~> 1.2'                                     # Peek integration with mysql
gem 'peek-performance_bar', '~> 1.3', '>= 1.3.1'                # Peek performance bar extension
gem 'peek-rblineprof', :platform => :ruby                       # Peek into how much each line of your Rails application takes throughout a request (doesn't work on Windows)
gem 'puma', '~> 5.0'                                            # Use Puma as the app server
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'                           # Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails-i18n', '~> 6.0'                                      # i18n
gem 'sanitize', '~> 5.2', '>= 5.2.1'                            # HTML & CSS Sanitizer
gem 'sass-rails', '>= 6'                                        # Use SCSS for stylesheets
gem 'thredded', '~> 1.0'                                        # Forums engine
gem 'turbolinks', '~> 5'                                        # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'tzinfo-data',                                              # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
    :platforms => [:mingw, :mswin, :x64_mingw, :jruby]
gem 'webpacker', '~> 5.0'                                       # Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

group :development, :test do
  gem 'byebug', :platforms => [:mri, :mingw, :x64_mingw]        # Call 'byebug' anywhere in the code to stop execution and get a debugger console
end

group :development do
  gem 'web-console', '>= 4.1.0'                                 # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
end

group :test do
  gem 'capybara', '>= 3.26'                                     # Adds support for Capybara system testing and selenium driver
  gem 'selenium-webdriver'
  gem 'webdrivers'                                              # Easy installation and use of web drivers to run system tests with browsers
end
