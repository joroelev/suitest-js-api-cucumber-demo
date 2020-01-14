@e2e @video
Feature: Test video playback
    Make sure that video player works as expected.

    Scenario: Video test
        Video must start playback as soon as video page is loaded.

        Given application is open
        When user presses up
        Then "WatchMe" navigation item is focused
        When user presses right exactly 3 times
        And user presses enter
        Then element "First tile" exists
        When user presses enter
        Then video is playing
        And user presses back
