require 'test_helper'

class BrandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save brand without name" do
    brand = Brand.new
    assert_not brand.save
  end
end
