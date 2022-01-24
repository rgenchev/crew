require "test_helper"

class TeamTest < ActiveSupport::TestCase
  def setup
    @team = teams(:development)
  end

  test "should be valid" do
    assert @team.valid?
  end

  test "should not be valid without name" do
    @team.name = nil

    refute @team.valid?
  end

  test "should not be valid with duplicate name" do
    dup_team = @team.dup

    refute dup_team.valid?

    assert dup_team.errors.added?(:name, 'has already been taken')
  end
end
