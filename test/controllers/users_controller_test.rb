require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user)
  end

  test "should get index if logged in" do
    login(@user)

    get users_url
    assert_response :success
  end

  test "should get show if logged in" do
    login(@user)

    get user_url(@user)
    assert_response :success
  end

  test "should not get index if not logged in" do
    get users_url
    assert_redirected_to login_url
  end

  test "should not get show if not logged in" do
    get user_url(@user)
    assert_redirected_to login_url
  end
end
