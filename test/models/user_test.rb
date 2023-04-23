require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save if user is blank" do
    assert_equal User.new.save, false
  end

  test "should if user is full" do
    # users name of users.yml

    @user = users(:va)
    assert_equal @user.save, true
  end
end
