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
 
 section_item_selector = "li.section-item"
 expect(page).to have_css(section_item_selector)
 section_items = find_all(section_item_selector)
 
 (@course_count).times do |index|
  find("span", :text => "Complete and continue").click
  WaitForAjax.wait
  if index  != @course_count - 1
   expect(section_items[index][:class].include? "completed")
  end
 end
end

Then(/^I should see all my courses completed$/) do
 expect(page).to have_content "Start next lecture" 
 visit "/courses"
 expect(page).to have_css("span.percentage", text: "100%")
end
