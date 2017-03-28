ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'active_support'
require 'active_support/core_ext'
require 'rails/test_help'
require 'factory_girl_rails'  #use if you are using FactoryGirl for fixtures

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting 
  # fixtures :all
  include FactoryGirl::Syntax::Methods

  # Add more helper methods to be used by all tests here...
end

%w( lib app/models ).each do |dir|
	$LOAD_PATH << dir
	ActiveSupport::Dependencies.autoload_paths << dir
end