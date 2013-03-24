$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "wacky/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wacky"
  s.version     = Wacky::VERSION
  s.authors     = ["Josh Adams"]
  s.email       = ["josh@isotope11.com"]
  s.homepage    = "http://www.isotope11.com"
  s.summary     = "A wiki engine for rails"
  s.description = "A wiki engine for rails"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.11"
  s.add_dependency "slim"
  s.add_dependency "redcarpet"
  s.add_dependency "jquery-rails"
  s.add_dependency "ace-rails-ap", "~> 1.0.0"
  s.add_dependency "paper_trail"
  s.add_dependency "showdown-rails"
  s.add_dependency "nokogiri"
  s.add_dependency "kaminari"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "combustion", '~> 0.3.1'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-matchers'
  s.add_development_dependency 'valid_attribute'
  s.add_development_dependency 'turn'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'minitest-capybara'
  s.add_development_dependency 'minitest-spec-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'mocha'
end
