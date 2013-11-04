Feature: Edit Admin
  As a registered admin of the website
  I want to edit my admin profile
  so I can change my adminname

    Scenario: I sign in and edit my account
      Given I am logged in
      When I edit my account details
      Then I should see an account edited message
