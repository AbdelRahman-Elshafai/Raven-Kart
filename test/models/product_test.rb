require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should create product" do
    product = Product.create(
                         title:'title', description:'description', stock:10,
                         price:10, brand_id:1
    )
    product.images.attach(io: File.open('public/apple-touch-icon.png'),
                          filename: 'apple-touch-icon.png',
                          content_type: 'application/png')
    assert product.save
  end
end
