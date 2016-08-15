Rails.application.config.generators do |g|
  g.fixture_replacement :factory_girl, dir: "spec/factories"
  g.helper false
  g.javascript_engine false
  g.request_specs false
  g.routing_specs false
  g.stylesheets false
  g.test_framework :rspec
  g.view_specs false
end
