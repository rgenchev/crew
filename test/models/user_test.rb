require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:user)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should not be valid without email" do
    @user.email = nil

    refute @user.valid?
  end

  test "should not be valid without name" do
    @user.name = nil

    refute @user.valid?
  end

  test "should not be valid without username" do
    @user.username = nil

    refute @user.valid?
  end

  test "should not be valid without role" do
    @user.role = nil

    refute @user.valid?
  end

  test "should not be valid with duplicate username or email" do
    dup_user = @user.dup

    refute dup_user.valid?

    assert dup_user.errors.added?(:email, 'has already been taken')
    assert dup_user.errors.added?(:username, 'has already been taken')
  end

  test "should not be valid without team" do
    @user.team = nil

    refute @user.valid?
  end

  test "should downcase username before save" do
    @user.username = "rGenchev"

    assert @user.save
    assert_equal "rgenchev", @user.username
  end

  test "should be able to be admin" do
    assert_equal "admin", users(:admin).role
  end

  test "should have two roles available (user and admin)" do
    User.roles.keys.each { |role| assert_includes ["user", "admin"], role }
  end
end
