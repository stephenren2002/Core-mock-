Feature: Upload a file to the doc-processing service

  Scenario: Try to upload stuff
    Given I open the doc processing app
    When I upload the file "C:\Users\dkirber\Documents\Hello World.docx"
    Then It should....be uploaded right?