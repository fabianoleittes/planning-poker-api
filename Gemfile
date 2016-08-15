source "https://rubygems.org"
ruby "2.3.1"


gem "rails",                  "~> 5.0.0"
gem "pg",                     "~> 0.18"
gem "puma",                   "~> 3.0"
gem "active_model_serializers"
gem "responders"
gem "rack-cors"

group :development, :test do
  gem "byebug",               platform: :mri
  gem "rspec-rails",          "~> 3.5", ">= 3.5.1"
  gem "factory_girl_rails",   "~> 4.7"
  gem "awesome_print"
  gem "bundler-audit",        ">= 0.5.0", require: false
  gem "dotenv-rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "brakeman"
  gem "rubocop"
end

group :development do
  gem "listen",               "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen","~> 2.0.0"
  gem "bullet"
end

group :test do
  gem "database_cleaner",     "~> 1.5", ">= 1.5.3"
  gem "shoulda-matchers",     "~> 3.1", ">= 3.1.1"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
