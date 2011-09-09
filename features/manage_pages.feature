Feature: Manage pages
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new page
    Given A default resource exist using an RSpec mock
    Given I am on the new page page
    When I fill in "Name" with "name 1"
    And I fill in "Content" with "content 1"
    And I press "Save"
    Then I should see "name 1"
    And I should see "content 1"

  Scenario: Delete page
    Given the following pages:
      |name|content|
      |name 1|content 1|
      |name 2|content 2|
      |name 3|content 3|
      |name 4|content 4|
    When I delete the 3rd page
    Then I should see the following pages:
      |Name|Content|
      |name 1|content 1|
      |name 2|content 2|
      |name 4|content 4|
