Feature: Creating artefacts
  In order to build GovUK
  I want to create artefacts in panopticon

  Background:
    Given I am an admin
    And I have stubbed url-arbiter

  Scenario: Creating artefacts directly in panopticon
    When I visit the homepage
    Then I should see a link to create an item

    When I follow the link link to create an item
    Then I should see the artefact form

    When I fill in the form without a need
     And I save, indicating that I want to go to the item

    Then I should be redirected to Publisher

  Scenario: Trying to create an artefact for a need that is already met
    Given an artefact exists
    When I try to create a new artefact with the same need
    Then I should be redirected to Publisher
