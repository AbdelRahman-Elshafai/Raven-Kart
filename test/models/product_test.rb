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

  test "should not create product without title" do
    @product = Product.new( description: 'description',stock: 10,price: 100)
    @product.brand = brands(:dell)
    @product.category = categories(:electronics)
    @product.store = stores(:bla)
    @product.images.attach(io: File.open("public/apple-touch-icon.png"), filename: "apple-touch-icon.png", content_type: "image/png")
    @product.images.attach(io: File.open("public/apple-touch-icon.png"), filename: "apple-touch-icon.png", content_type: "image/png")
    assert_not @product.save
  end

  test "should not create product without description" do
    @product = Product.new( title:'title',stock: 10,price: 100)
    @product.brand = brands(:dell)
    @product.category = categories(:electronics)
    @product.store = stores(:bla)
    @product.images.attach(io: File.open("public/apple-touch-icon.png"), filename: "apple-touch-icon.png", content_type: "image/png")
    @product.images.attach(io: File.open("public/apple-touch-icon.png"), filename: "apple-touch-icon.png", content_type: "image/png")
    assert_not @product.save
  end

  test "should not create product without stock" do
    @product = Product.new( title:'title',description: 'description',price: 100)
    @product.brand = brands(:dell)
    @product.category = categories(:electronics)
    @product.store = stores(:bla)
    @product.images.attach(io: File.open("public/apple-touch-icon.png"), filename: "apple-touch-icon.png", content_type: "image/png")
    @product.images.attach(io: File.open("public/apple-touch-icon.png"), filename: "apple-touch-icon.png", content_type: "image/png")
    assert_not @product.save
  end



end
