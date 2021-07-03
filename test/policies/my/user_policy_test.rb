require "test_helper"

class My::UserPolicyTest < ActiveSupport::TestCase
  def setup
    @user = users(:user)
    @admin = users(:admin)
  end

  test "logged in admin should be authorized to update themselves" do
    assert My::UserPolicy.new(@admin, @admin).update?
  end

  test "logged in admin should not be authorized to update other users" do
    refute My::UserPolicy.new(@admin, @user).update?
  end

  test "logged in admin should be authorized to get edit for themselves" do
    assert My::UserPolicy.new(@admin, @admin).edit?
  end

  test "logged in admin should not be authorized to get edit for other users" do
    refute My::UserPolicy.new(@admin, @user).edit?
  end

  test "logged in user should be authorized to update themselves" do
    assert My::UserPolicy.new(@user, @user).update?
  end

  test "logged in user should not be authorized to update other users" do
    refute My::UserPolicy.new(@user, @admin).update?
  end

  test "logged in user should be authorized to get edit for themselves" do
    assert My::UserPolicy.new(@user, @user).edit?
  end

  test "logged in user should not be authorized to get edit for other users" do
    refute My::UserPolicy.new(@user, @admin).edit?
  end
end
