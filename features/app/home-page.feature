@e2e @home
Feature: Test home page
    Home page displays a list of top menu and assets available for user to view.

    Scenario: Top menu navigation
        Make sure that top navigation works as expected.

        Given application is open
        Then "All Files tile" navigation item is focused
        And "WatchMe" navigation item is selected
        When user presses up
        Then "WatchMe" navigation item is focused
        And main menu items are selectable:
            | Main Menu item 1 |
            | Main Menu item 2 |
            | Main Menu item 3 |
            | Main Menu item 4 |

    Scenario: Top menu drop-down
        Make sure that drop-down in the right corner of the menu can be opened and pop-ups are shown

        Given application is open
        When user presses up
        Then "WatchMe" navigation item is focused
        When user presses right exactly 5 times
        Then "Drop down main menu item" navigation item is focused
        And element "Drop down main menu container" exists
        And "Privacy main menu item" navigation item is focused
        When user presses enter
        Then element "Modal popup" exists
        When user presses enter
        Then element "Modal popup" does not exist
        When user presses down
        Then "Imprint main menu item" navigation item is focused
        When user presses enter
        Then element "Modal popup" exists
        When user presses enter
        Then element "Modal popup" does not exist

    Scenario: Tiles navigation
        Check tiles navigation. We already have Test Editor test for this item and we want to keep it there
        e.g. so that non-technical people could also edit it.

        Given application is open
        Then run Test Editor snippet "Navigating on homepage"
