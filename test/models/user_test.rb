require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should create user without avatar" do
    user = User.new(name:'admin',email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password' ,address:'11-admin-admin' , role_id: 1)
    assert_not user.save
  end

end
