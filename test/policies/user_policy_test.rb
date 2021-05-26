require "test_helper"

class UserPolicyTest < ActiveSupport::TestCase
  def setup
    @user = users(:user)
    @admin = users(:admin)
  end

  test "logged in admin should be authorized to get index" do
    assert UserPolicy.new(@admin, User).index?
  end

  test "logged in admin should be authorized to get show" do
    assert UserPolicy.new(@admin, @user).show?
  end

  test "logged in user should be authorized to get index" do
    assert UserPolicy.new(@user, User).index?
  end

  test "logged in user should be authorized to get show" do
    assert UserPolicy.new(@user, @admin).show?
  end

  test "not logged in user should not be authorized to get index" do
    refute UserPolicy.new(nil, User).index?
  end

  test "not logged in user should not be authorized to get show" do
    refute UserPolicy.new(nil, @admin).show?
  end
end
