ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
abort("DATABASE_URL environment variable is set") if ENV["DATABASE_URL"]

require "spec_helper"
require "rspec/rails"
require "shoulda/matchers"
require "json_matchers/rspec"

Dir[Rails.root.join("spec/support/**/*.rb")].sort.each { |file| require file }

RSpec.configure do |config|
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false
  config.before(:each, type: :request) do
    host! "api.planning-poker.dev"
  end
end

ActiveRecord::Migration.maintain_test_schema!
