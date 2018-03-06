source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

gem 'oauth2', '~> 1.4'
gem 'rails_admin', '~> 1.2'

# Pagination
gem 'api-pagination', '~> 4.6', '>= 4.6.3'
gem 'kaminari', '~> 1.1', '>= 1.1.1'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.21.0'

# Job Asynchrone
gem 'delayed_job', '~> 4.1', '>= 4.1.3'
gem 'delayed_job_active_record', '~> 4.1', '>= 4.1.2'
gem 'daemons', '~> 1.2', '>= 1.2.5'

group :production do
  gem 'redis-rails'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i(mri mingw x64_mingw)
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i(mingw mswin x64_mingw jruby)
