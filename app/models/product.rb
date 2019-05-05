class Product < ApplicationRecord
  belongs_to :store
  belongs_to :brand
  belongs_to :category
  has_many :feedbacks
  has_many :cart_products
  has_many :shopping_carts, through: :cart_products
  has_many :order_products
  has_many :orders, through: :order_products
  has_many_attached :images

  validates :title, :description, 
    length: { minimum: 3 ,maximum: 255}
  validates :stock, 
    numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :price, 
    numericality: { only_integer: true, greater_than: 0 }
  validates :brand_id, :title, :description, :stock, :price, 
    presence: true
  validates :images,
  attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
  limit: { min: 2, max: 6 }

  searchable do
    text :title
    text :description
    float :price

    integer :category_id, references: Category
    integer :brand_id , references: Brand
    integer :store_id , references: Store
  end
  before_validation :default_product_image

  def product_category
    self.category.name
  end

  def product_brand
    self.brand.name
  end

  def default_product_image
    unless images.attached?
      images.attach(io: File.open("public/product_img_1.jpg") , filename: "public/product_img_1.jpg" , content_type: "image/jpg")
      images.attach(io: File.open("public/product_img_2.jpg") , filename: "public/product_img_2.jpg" , content_type: "image/jpg")

    end
  end
end
