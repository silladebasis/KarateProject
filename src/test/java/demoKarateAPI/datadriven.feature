Feature: Create,Update and Delete Posts in demo API

Background: 
    Given url 'https://jsonplaceholder.typicode.com/'

Scenario Outline: Fetch only one post based on id and validate the response using markers in karate
    #* def id = 2
    And path 'posts'
    And path <id>
    When method get
    Then status 200     
    And match response == 
    """
        {
            "userId": '#number',
            "id": <id>,
            "title": "#string",
            "body": "#string"
        }
    """
    Examples:
    |id|
    |2| 
    |3|   

Scenario Outline: Verify a new post is created
    And path 'posts'
    And request 
    """
    {
        title: '<title>',
        body: '<body>',
        userId: <userId>
    }
     """
    And header 'Content-Type' = 'application/json; charset=utf-8'
    When method post
    Then status 201
    And match response.title == "<title>"    

   Examples:
   |title|body|userId|
   |Karate Learning|Practice Karate|1|
   |API Automation|API Testing|2| 

Scenario Outline: Verify a new post is created using external json file
    And path 'posts'
    And request 
    """
    {
        title: '<title>',
        body: '<body>',
        userId: <userId>
    }
     """
    And header 'Content-Type' = 'application/json; charset=utf-8'
    When method post
    Then status 201
    And match response.title == "<title>"    

   Examples:
   |read('testData/data.json')|
   