ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'active_support'
require 'active_support/core_ext'
require 'rails/test_help'
require 'factory_girl_rails'  #use if you are using FactoryGirl for fixtures
require 'rake/testtask'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting 
  # fixtures :all
  include FactoryGirl::Syntax::Methods

  # Load support folder, which contains helpers and other common code for tests
  Dir[Rails.root.join("test/support/**/*.rb")].each {|f| require f}

  # Implements transaction based setup and teardown of database, to ensure clean testing
  DatabaseCleaner.strategy = :transaction

  def setup
      DatabaseCleaner.start
  end

  def teardown
      DatabaseCleaner.clean
  end
end

%w( lib app/models ).each do |dir|
	$LOAD_PATH << dir
	ActiveSupport::Dependencies.autoload_paths << dir
end

namespace :test do
  Rails::TestTask.new("test:services" => "test:prepare") do |t|
      t.pattern = "test/services/**/*_test.rb"
  end
end

Rake::Task["test:run"].enhance ["test:services"]