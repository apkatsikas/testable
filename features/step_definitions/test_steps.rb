Given(/^I am logged in to a new account$/) do
 visit "/"
 click_link "Enroll Now"
 
 password = RandomUtil.random_password
 fill_in "user_name", :with => "Test User"
 fill_in "user_email", :with => RandomUtil.random_email
 fill_in "user_password", :with => password
 fill_in "user_password_confirmation", :with => password
 page.check "user_agreed_to_terms"
 click_button "Sign Up"
end

When(/^I enroll in a course$/) do
 find(".course-listing").click
 click_button "enroll-button-top"
end

Then(/^I should see the enrollment thank you$/) do
 expect(page).to have_content "Thanks for enrolling in this course!" 
end

When(/^I complete (\d+) lectures$/) do |course_count|
 @course_count = course_count
 click_link "Continue to Course"
 click_link "Start next lecture"
 @course_count.times { find("span", :text => "Complete and continue").click }
end

Then(/^I should see all my courses completed$/) do
 sleep 5
 find_all(".section-item li")[0..@course_count + 1].each do |item|
  Kernel.puts item
  expect(item[:class].include? "completed")
 end
end
