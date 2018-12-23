class WaitForAjax
  def self.wait
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until Capybara.page.evaluate_script("jQuery.active").zero?
    end
  end
end