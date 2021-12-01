@e2e @home
Feature: Navigation

    Checking app navigation

    Scenario: Navigating to the right and left
        Given application is open
        When user presses right exactly 4 times
        Then "Big Bunny titile" should be selected
        And user presses left
        Then "Sintel title" should be selected

    Scenario: Navigation up/down
        Given application is open
        And "Cominandes 1 title" should be selected
        When user presses up
        Then "Cominandes 1 title" should be selected
        When user presses down
        Then "Cominandes 1 title" should be selected

    Scenario: Returning to homepage by VRC Back button
        Given application is open
        When user presses enter
        And video is playing
        When user presses back
        Then "Cominandes 1 title" should be selected

    Scenario: Returning to homepage by UI
        Given application is open
        When user presses enter
        And video is playing
        When user presses left exactly 2 times
        Then user presses enter
        And "Cominandes 1 title" should be selected