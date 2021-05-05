require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index if logged in" do
    login(users(:user))
    get root_url
    assert_response :success
  end

  test "should not get index if not logged in" do
    get root_url
    assert_redirected_to login_url
  end
end
