Feature: Sign in
  In order to get access to protected sections of the site
  A admin
  Should be able to sign in

    Scenario: Admin is not signed up
      Given I do not exist as a admin
      When I sign in with valid credentials
      Then I see an invalid login message
        And I should be signed out

    Scenario: Admin signs in successfully
      Given I exist as a admin
        And I am not logged in
      When I sign in with valid credentials
      Then I see a successful sign in message
      When I return to the site
      Then I should be signed in

    Scenario: Admin enters wrong email
      Given I exist as a admin
      And I am not logged in
      When I sign in with a wrong email
      Then I see an invalid login message
      And I should be signed out
      
    Scenario: Admin enters wrong password
      Given I exist as a admin
      And I am not logged in
      When I sign in with a wrong password
      Then I see an invalid login message
      And I should be signed out

      