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
end
