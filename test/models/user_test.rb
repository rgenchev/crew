require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should be valid" do
    assert users(:valid).valid?
  end

  test "should not be valid without email" do
    user = users(:valid)
    user.email = nil

    refute user.valid?
  end

  test "should not be valid without name" do
    user = users(:valid)
    user.name = nil

    refute user.valid?
  end

  test "should not be valid without username" do
    user = users(:valid)
    user.username = nil

    refute user.valid?
  end

  test "should downcase username before save" do
    user = users(:valid)
    user.username = "jDoe"

    assert user.save
    assert_equal "jdoe", user.username
  end

  test "should not be valid with duplicate username or email" do
    user = users(:valid)
    dup_user = user.dup

    refute dup_user.valid?

    assert dup_user.errors.added?(:email, 'has already been taken')
    assert dup_user.errors.added?(:username, 'has already been taken')
  end

  test "should not be valid without team" do
    user = users(:valid)
    user.team = nil

    refute user.valid?
  end
end
