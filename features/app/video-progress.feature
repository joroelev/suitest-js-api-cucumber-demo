@e2e @video
Feature: Video progress

    Checking video progress assets, fast forwarding and rewind

    Scenario: Video progress
        Given application is open
        When user presses enter
        And video is playing
        When user waiting 30 seconds
        Then video position should be greater then 30 seconds

    Scenario: Fast forward/rewind video
        Given application is open
        When user presses enter
        Then video is playing
        When user presses right
        And user presses enter exactly 4 times
        Then video position should be greater then 40 seconds
        When user presses left exactly 2 times
        And user presses enter exactly 2 times
        Then video position should be less then 25 seconds

    