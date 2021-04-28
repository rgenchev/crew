require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  include ApplicationHelper

  test "should return tachyons classes according to the passed alert level" do
    assert_equal "blue bg-washed-blue", flash_message_classes_for_alert_level("notice")
    assert_equal "green bg-washed-green", flash_message_classes_for_alert_level("success")
    assert_equal "red bg-washed-red", flash_message_classes_for_alert_level("error")
    assert_equal "gold bg-washed-yellow", flash_message_classes_for_alert_level("alert")
  end
end
