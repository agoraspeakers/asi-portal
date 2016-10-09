source 'https://rubygems.org'

gem 'rails', '~> 5.0', '>= 5.0.0.1'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.0'

# views
gem 'simple_form'
gem 'responders', '~> 2.0'

# styles
gem 'bh', github: "buren/bh", branch: "disable-form-builder" # https://github.com/Fullscreen/bh/pull/150
gem 'bootstrap-sass'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

# js
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# api
gem 'jbuilder', '~> 2.5'

# auth
gem 'devise', '~> 4.2'
gem 'devise_invitable'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-instagram'
gem 'omniauth-twitter'
gem 'instagram'
gem 'twitter'

# utility
gem "workflow"
gem "cancancan", "~> 1.10"
gem "composite_primary_keys", "~> 9.0"
gem "geocoder"

group :test do
  gem 'webmock'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'

  # Use Capistrano for deployment
  gem 'capistrano-rails', group: :development
end
