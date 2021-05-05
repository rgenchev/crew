require "test_helper"

class My::Users::ChangePasswordControllerTest < ActionDispatch::IntegrationTest
  def setup
    super

    @user = users(:user)
    login(@user)
  end

  test "should update password if 'old_password' match the current password, 'new_password' and 'new_password_confirmation' match and user is logged in" do
    patch my_account_change_password_url, params: {
      user: {
        old_password: 'Test1234#',
        new_password: 'Test',
        new_password_confirmation: 'Test'
      }
    }

    @user.reload

    assert_equal @user.authenticate('Test'), @user
    assert_redirected_to my_account_url
    assert_equal 'Password was successfully changed.', flash[:success]
  end

  test "should not update password if 'old_password' does not match the current password and user is logged in" do
    patch my_account_change_password_url, params: {
      user: {
        old_password: 'notright',
        new_password: 'Test',
        new_password_confirmation: 'Test'
      }
    }

    @user.reload

    refute @user.authenticate('Test')
    assert_redirected_to my_account_url
    assert_equal 'Old password does not match the current password.', flash[:error]
  end

  test "should not update password if either 'new_password' or 'new_password_confirmation' is blank and user is logged in" do
    patch my_account_change_password_url, params: {
      user: {
        old_password: 'Test1234#',
        new_password: '',
        new_password_confirmation: 'Test'
      }
    }

    @user.reload

    refute @user.authenticate('Test')
    assert_redirected_to my_account_url
    assert_equal 'New password and new password confirmation cannot be empty.', flash[:error]
  end

  test "should not update password if 'new_password' and 'new_password_confirmation' do not match and user is logged in" do
    patch my_account_change_password_url, params: {
      user: {
        old_password: 'Test1234#',
        new_password: 'Test',
        new_password_confirmation: 'something_else'
      }
    }

    @user.reload

    refute @user.authenticate('Test')
    assert_redirected_to my_account_url
    assert_equal 'New password and new password confirmation do no match.', flash[:error]
  end

  test "should not update password if user is not logged in" do
    logout

    patch my_account_change_password_url, params: {
      user: {
        old_password: 'Test1234#',
        new_password: 'Test',
        new_password_confirmation: 'Test'
      }
    }

    @user.reload

    refute @user.authenticate('Test')
    assert_redirected_to login_url
  end
end
