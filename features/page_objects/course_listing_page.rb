include Capybara::DSL

class CourseListingPage
  def enroll
    find('.course-listing').click
    click_button 'enroll-button-top'
  end
end
