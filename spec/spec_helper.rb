# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require 'spec_helper_without_rails'
Bundler.require :default, :test

require 'combustion'
Combustion.initialize!

require 'minitest-capybara'
require 'minitest-spec-rails'
require 'valid_attribute'

require 'action_controller/test_case'
require 'rails/test_help'

require 'capybara/rails'
require 'database_cleaner'

Turn.config.format = :outline

class AcceptanceSpec < MiniTest::Spec
  include Capybara::RSpecMatchers
  include Capybara::DSL
end

DatabaseCleaner.strategy = :truncation

class MiniTest::Spec
  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
end
