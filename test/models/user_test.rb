require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should  create user " do
    @user = users(:testuser)
    @user.avatar.attach(io: File.open("public/apple-touch-icon.png"), filename: "apple-touch-icon.png", content_type: "image/png")
    assert @user.save
  end

end
