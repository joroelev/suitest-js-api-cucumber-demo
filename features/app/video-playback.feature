@e2e @video
Feature: Video playback

    Checking video playback

    Scenario: Starting a video
        Given application is open
        When user presses right exactly 2 times
        Then "Cominandes 3 title" should be selected
        When user presses enter
        Then video is playing

    Scenario: Pausing/Resuming video by UI
        Given application is open
        When user presses enter
        Then video is playing
        When user presses enter
        Then video is paused or stopped
        When user presses enter
        Then video is playing

    Scenario: Pausing/Resuming video by VRC
        Given application is open
        When user presses enter
        Then video is playing
        When user presses pause
        Then video is paused or stopped
        When user presses play
        Then video is playing