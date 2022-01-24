require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_url
    assert_response :success
  end

  test "should log in user with valid credentials" do
    user = users(:user)

    post login_url, params: {
      email: user.email,
      password: "Test1234#"
    }

    assert_equal user.id, session[:user_id]
    assert_redirected_to root_url
    assert_equal "Logged in!", flash[:notice]
  end

  test "should not log in user with invalid credentials" do
    post login_url, params: {
      email: "non_existing_email@example.com",
      password: "Test1234#"
    }

    assert_nil session[:user_id]
    assert_redirected_to login_url
    assert_equal "Email or password is invalid", flash[:error]
  end

  test "should log out user already logged in user" do
    login(users(:user))

    delete logout_url

    assert_nil session[:user_id]
    assert_redirected_to root_url
    assert_equal "Logged out!", flash[:notice]
  end

  test "should not be able to log out if not logged in first" do
    delete logout_url

    assert_nil session[:user_id]
    assert_redirected_to login_url
  end
end
