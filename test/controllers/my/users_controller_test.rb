require "test_helper"

class My::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit if logged in" do
    user = users(:user)
    login(user)

    get my_account_url

    assert_response :success
  end

  test "should be able to update account if logged in" do
    user = users(:user)
    login(user)

    put my_account_url, params: {
      user: {
        name: "John Doe",
        team_id: teams(:accounting).id
      }
    }

    assert_redirected_to my_account_url
    assert_equal "You've successfully updated your account.", flash[:success]
    assert_equal "John Doe", user.name
    assert_equal teams(:accounting), user.team
  end

  test "should not get edit if not logged in" do
    get my_account_url

    assert_redirected_to login_url
  end

  test "should not be able to update account if not logged in" do
    put my_account_url, params: {
      user: {
        name: "John Doe",
        team_id: teams(:accounting).id
      }
    }

    assert_redirected_to login_url
  end
end
