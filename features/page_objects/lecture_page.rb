include Capybara::DSL
include RSpec::Matchers
include WaitForAjax

class LecturePage
  @@section_item_selector = 'li.section-item'

  def complete_lectures(lecture_count)
    expect(page).to have_css(@@section_item_selector)
    section_items = find_all(@@section_item_selector)

    lecture_count.times do |index|
      find('span', text: 'Complete and continue').click
      WaitForAjax.wait
      # if last course - don't wait for completed
      if index != lecture_count - 1
        expect(section_items[index][:class].include?('completed'))
      end
    end
  end
end
