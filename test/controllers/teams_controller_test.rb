require "test_helper"

class TeamsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user)
    @team = teams(:development)
  end

  test "should get index if logged in" do
    login(@user)

    get teams_url
    assert_response :success
  end

  test "should get show if logged in" do
    login(@user)

    get team_url(@team)
    assert_response :success
  end

  test "should raise 404 if team does not exist" do
    login(@user)

    get team_url("non-existing-team")
    assert_response :not_found
  end

  test "should not get index if not logged in" do
    get teams_url
    assert_redirected_to login_url
  end

  test "should not get show if not logged in" do
    get team_url(@team)
    assert_redirected_to login_url
  end
end
