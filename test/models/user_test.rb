require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should create user" do
    user = User.new(
      name: users(:one).name,
      email: users(:one).email,
      avatar: users(:one).avatar,
      role_id: 1
    )
    assert user.save
  end
end
