@e2e @image
Feature: Image gallery page
    Check if images can be opened

    Scenario: Open image
        First, navigate to some image

        Given application is open
        When user presses up
        Then "WatchMe" navigation item is focused
        When user presses right exactly 2 times
        And user presses enter
        Then element "First tile" exists
        When user presses enter
        Then element "Image" is loaded
