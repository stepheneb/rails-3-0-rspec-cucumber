require 'cucumber/rails'

require File.expand_path('../../../spec/spec_helper.rb', __FILE__)

Capybara.default_selector = :css

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Before do
 # To get RSpec stubs and mocks working.
 $rspec_mocks ||= RSpec::Mocks::Space.new
end

After do
   begin
     $rspec_mocks.verify_all
   ensure
     $rspec_mocks.reset_all
   end
end
