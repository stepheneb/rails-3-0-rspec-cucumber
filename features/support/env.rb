require 'cucumber/rails'

require File.expand_path('../../../spec/spec_helper.rb', __FILE__)

require 'rspec/rails'
require 'rspec/mocks'

Capybara.default_selector = :css

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

World(RSpec::Rails::Mocks)