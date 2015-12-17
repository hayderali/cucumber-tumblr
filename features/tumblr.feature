Feature: Posting a valid Text Post on Tumblr after login

  Background:
    Given I'm logged into Tumblr
    And I'm on my dashboard
    And I click on a text post
    
  @wip
  Scenario: Posting a text post with just a title
    When I enter "Hello" into the title box
    And I click on the post button
    Then My dashboard should contain a text post with the title "Hello"
  
  @posting
  Scenario: Posting a text post with just a message
    When I enter "Hello" into the message box
    And I click on the post button
    Then My dashboard should contain a text post with the message "Hello"
  
  @posting
  Scenario: Posting a text post with a title and a message
    When I enter "Hello" into the title box
    And I enter "This is a test post" into the message box
    And I click on the post button
    Then My dashboard should contain a text post with the title "Hello"
    And My dashboard should contain a text post with the message "This is a test post"
  
  @will_not_post
  Scenario: Posting a text post without a title and a message
    Given the title box and message box are empty
    When I click the post button nothing should happen 
    
