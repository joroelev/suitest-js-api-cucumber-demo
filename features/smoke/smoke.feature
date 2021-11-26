@smoke
Feature: Smoke test
  Smoke test only detects if application build is launchable and it makes sense to continue running other tests on it.

  Scenario: Home page loaded
    Given application is open
    Then element "App" exists
    And element "Logo" exists
