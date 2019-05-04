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
  validates :stock, :price, 
    numericality: { only_integer: true, greater_than: 0 }
  validates :brand_id, :title, :description, :stock, :price, 
    presence: true

  searchable do
    text :title
    text :description
    float :price

    integer :category_id, references: Category
    integer :brand_id , references: Brand
    integer :store_id , references: Store
  end
  def product_category
    self.category.name
  end

  def product_brand
    self.brand.name
  end
end
