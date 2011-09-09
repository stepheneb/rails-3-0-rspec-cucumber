## Simple Rails 3.0.10 App with RSpec, Cucumber and HAML

This app demonstrates a problem using RSpec-Rails mock_model method from a Cucumber feature.

Setup the app for running RSpec and Cucumber tests:

    bundle install
    bundle install --binstubs
    bin/rake db:migrate
    bin/rake db:test:prepare

Running the RSpec tests:

    $ bin/rspec spec
    ................................

    Finished in 0.80439 seconds
    32 examples, 0 failures

Running the Cucumber feature:

    $ bin/cucumber featuresUsing the default profile...
    Feature: Manage pages
      In order to [goal]
      [stakeholder]
      wants [behaviour]

      Scenario: Register new page                          # features/manage_pages.feature:6
        Given A default resource exist using an RSpec mock # features/step_definitions/resource_mock_steps.rb:1
          undefined method `mock_model' for #<Cucumber::Rails::World:0x00000102e44cd0> (NoMethodError)
          ./spec/support/app_helper.rb:3:in `generate_resource_with_mock'
          ./features/step_definitions/resource_mock_steps.rb:2:in `/^A default resource exist using an RSpec mock$/'
          features/manage_pages.feature:7:in `Given A default resource exist using an RSpec mock'
        Given I am on the new page page                    # features/step_definitions/web_steps.rb:44
        When I fill in "Name" with "name 1"                # features/step_definitions/web_steps.rb:60
        And I fill in "Content" with "content 1"           # features/step_definitions/web_steps.rb:60
        And I press "Save"                                 # features/step_definitions/web_steps.rb:52
        Then I should see "name 1"                         # features/step_definitions/web_steps.rb:105
        And I should see "content 1"                       # features/step_definitions/web_steps.rb:105

      Scenario: Delete page                    # features/manage_pages.feature:15
        Given the following pages:             # features/step_definitions/page_steps.rb:1
          | name   | content   |
          | name 1 | content 1 |
          | name 2 | content 2 |
          | name 3 | content 3 |
          | name 4 | content 4 |
        When I delete the 3rd page             # features/step_definitions/page_steps.rb:5
        Then I should see the following pages: # features/step_definitions/page_steps.rb:12
          | Name   | Content   |
          | name 1 | content 1 |
          | name 2 | content 2 |
          | name 4 | content 4 |

    Failing Scenarios:
    cucumber features/manage_pages.feature:6 # Scenario: Register new page

    2 scenarios (1 failed, 1 passed)
    10 steps (1 failed, 6 skipped, 3 passed)
    0m2.378s