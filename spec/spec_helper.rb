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

include Wacky

class AcceptanceSpec < MiniTest::Spec
  include Capybara::RSpecMatchers
  include Capybara::DSL
end
