Feature: GitHub Gist

  Scenario Outline: Create a new Gist
    Given I have a valid auth token
    When I create a new Gist with description <description>, filename <filename> and content <content>
    Then the new Gist with description <description> is created successfully

    Examples:
      | Description               | Filename   | Content             |
      | Testing Gist Creation API | myFile.txt | This is a test Gist |


  Scenario Outline: Get all Gists for a user
    Given I have a valid auth token
    When I create a new Gist with description <description>, filename <filename> and content <content>
    And I retrieve all Gists for my user
    Then a Gist with description <description>, filename <filename> and content <content> is present in the list

    Examples:
      | Description               | Filename   | Content             |
      | Testing Gist Creation API | myFile.txt | This is a test Gist |

    Scenario Outline: Update an existing Gist
      Given I have a valid auth token
      When I create a Gist with description "Testing Gist Update API" and the following details:
        | Filename    | Content                   |
        | myFile1.txt | This file will be updated |
        | myFile2.txt | This file will be deleted |
      And I update the contents of "myFile1.txt" to "Text successfully updated"
      And I delete "myFile2.txt"
      Then the content of "myFile1.txt" is successfully updated
      And the file "myFile2.txt" is deleted

    Scenario: Delete a Gist
      Given I have a valid auth token
      When I create a Gist with description "Testing Gist Delete API" and the following details:
        | Filename    | Content                   |
        | myFile3.txt | This file will be deleted |
      And I delete myFile3.txt
      Then the file "myFile3.txt" is deleted