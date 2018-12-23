Feature: Course enrollment and completion

Scenario: Enroll and complete course
 Given I am logged in to a new account
 When I enroll in a course
 Then I should see the enrollment thank you
 When I complete 4 lectures
 Then I should see all my courses completed