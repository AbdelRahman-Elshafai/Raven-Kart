require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should create product" do
    @product = products(:product)
    @product.images.attach(io: File.open("public/apple-touch-icon.png"), filename: "apple-touch-icon.png", content_type: "image/png")
    @product.images.attach(io: File.open("public/apple-touch-icon.png"), filename: "apple-touch-icon.png", content_type: "image/png")
    assert @product.save
  end
end
