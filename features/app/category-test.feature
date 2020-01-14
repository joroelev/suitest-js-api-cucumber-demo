@e2e @category
Feature: Category page test
    Test scenario makes sure that category page displays correct data.
    Illustrates how data can be fetched from server and used to build test scenario dynamically.

    Scenario: Category page dynamic test
        First of all, we need to navigate to the page we would like to test.

        Given application is open
        When user presses up
        Then "WatchMe" navigation item is focused
        When user presses right exactly 3 times
        And user presses enter
        Then element "First tile" exists
        Then "home-list-videos" page items are rendered
