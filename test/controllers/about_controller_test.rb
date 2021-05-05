require "test_helper"

class AboutControllerTest < ActionDispatch::IntegrationTest
  test "should get index if logged in" do
    login(users(:user))
    get about_url
    assert_response :success
  end

  test "should not get index if not logged in" do
    get about_url
    assert_redirected_to login_url
  end
end
