# Configure spec_helper.rb
ENV["RAILS_ENV"] = "test"
require File.expand_path("../dummy/config/environment.rb", __FILE__)

require 'rspec/rails'
require 'coveralls'

ENGINE_RAILS_ROOT = File.join(File.dirname(__FILE__), '../')
Coveralls.wear!
# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  # Use color in STDOUT
  config.color = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate

  config.before(:each) do
  end

  config.after(:each) do
  end
end
