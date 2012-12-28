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

include Wacky
