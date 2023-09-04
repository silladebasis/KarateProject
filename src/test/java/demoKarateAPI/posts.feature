Feature: Create,Update and Delete Posts in demo API

Background: 
    Given url 'https://jsonplaceholder.typicode.com/'

Scenario: Verify a new post is created
    And path 'posts'
    And request 
    """
    {
        title: 'Karate Testing',
        body: 'Karate Demo Practice',
        userId: 1
    }
     """
    And header 'Content-Type' = 'application/json; charset=utf-8'
    When method post
    Then status 201
    And match response.title == "Karate Testing"

Scenario: Verify a post can be updated
    And def postId = 1
    And path 'posts'
    And path postId
    And request 
    """
    {
        title: 'Karate Testing 1.0',
        body: 'Karate Demo Practice',
        userId: 1
    }
     """
    And header 'Content-Type' = 'application/json; charset=utf-8'
    When method put
    Then status 200
    * print response
    And match response.title == "Karate Testing 1.0"  
    
Scenario: Verify a post is deleted
    And def postId = 1
    And path 'posts'
    And path postId
    When method delete
    Then status 200    