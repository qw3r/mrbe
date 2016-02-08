source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '>= 5.0.0.beta2', '< 5.1'
gem 'pg', '~> 0.18'
gem 'puma'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

gem 'rails_12factor', group: :production

group :development, :test do
  gem 'dotenv-rails', require: 'dotenv/rails-now'
  gem 'rspec-rails', '>= 3.5.0.beta1'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'database_cleaner', require: false
end
