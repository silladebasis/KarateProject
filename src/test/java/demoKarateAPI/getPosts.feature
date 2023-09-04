Feature: Verify posts

Background:
    Given url 'https://jsonplaceholder.typicode.com/'

Scenario: Get All Posts
    And path 'posts'
    When method get
    Then status 200
    And assert response.length == 100
    And assert responseTime < 1000
    * print responseCookies
    And match responseHeaders['Content-Type'][0] == 'application/json; charset=utf-8'
    #fuzzy matchers in karate
    And match response == '#array'
    And match response[6] == {"userId": 1,"id": 7,"title": "#string","body": "#string"} 
    And match response[*] contains {"userId": 1,"id": 7,"title": "#string","body": "#string"} 
 
Scenario: Fetch only one post based on id
    And path 'posts/2'
    When method get
    Then status 200 

Scenario: Fetch the comments using query parameter
    * def postID = 3
    And path 'comments'
    And param postId = postID
    And header Accept-Encoding = 'gzip,deflate'
    When method get
    Then status 200   
    
Scenario: Fetch only one post based on id and validate the response using markers in karate
    * def id = 2
    And path 'posts'
    And path id
    When method get
    Then status 200     
    And match response == 
    """
        {
            "userId": '#number',
            "id": '#(id)',
            "title": "#string",
            "body": "#string"
        }
    """