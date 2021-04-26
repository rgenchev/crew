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

  test "should not be valid without team" do
    user = users(:valid)
    user.team = nil

    refute user.valid?
  end
end
