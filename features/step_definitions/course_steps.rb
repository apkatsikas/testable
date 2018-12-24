Given(/^I am logged in to a new account$/) do
 visit "/"
 click_link "Enroll Now"
 
 SignUpPage.new.sign_up
end

When(/^I enroll in a course$/) do
 CourseListingPage.new.enroll
end

Then(/^I should see the enrollment thank you$/) do
 expect(page).to have_content "Thanks for enrolling in this course!" 
end

When(/^I complete (\d+) lectures$/) do |lecture_count|
 click_link "Continue to Course"
 click_link "Start next lecture"
 
 LecturePage.new.complete_lectures lecture_count
end

Then(/^I should see all my courses completed$/) do
 expect(page).to have_content "Start next lecture" 
 visit "/courses"
 expect(page).to have_css("span.percentage", text: "100%")
end
