require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should not create user without name" do
    user = User.new(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password' ,address:'11-admin-admin' , role_id: 1)
    assert_not user.save
  end

  test "should not create user without avatar" do
    user = User.new(name:'admin',email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password' ,address:'11-admin-admin' , role_id: 1)

    # user.avatar.attach(io: File.open("public/apple-touch-icon.png"), filename: "apple-touch-icon.png", content_type: "image/jpg")

    assert_not user.save
  end

end
