require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should create role" do
    @role = roles(:admin)
    assert @role.save
  end
end
