Feature: Add event
  In order to have events on the calendar
  As an admin
  I want to be able to add events

  Scenario: Admin adds an event
    Given I am logged in
    When I look at the add event page
    Then I should see "Create New Event"

  Scenario: Normal user can't add an event
    Given I am not logged in
    When I look at the add event page
    Then I should see "You need to sign in or sign up before continuing."

