# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require 'rubygems'
require 'bundler'

Bundler.require :default, :test

require 'combustion'

Combustion.initialize!

require 'pry'

require 'turn/autorun'
require 'minitest/spec'
require 'minitest/matchers'
require 'valid_attribute'
require 'turn'

require 'action_controller/test_case'
require 'rails/test_help'

require 'capybara/rails'
require 'capybara/rspec/matchers'
require 'database_cleaner'

include Wacky

class AcceptanceSpec < MiniTest::Spec
  include Capybara::RSpecMatchers
  include Capybara::DSL
end

DatabaseCleaner.strategy = :transaction

class MiniTest::Spec
  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
end
