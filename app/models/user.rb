class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable ,:registerable
  has_many :addresses 
  has_many :products
  has_many :feedbacks
  has_many :orders
  has_one :store
  has_one :shopping_cart
  belongs_to :role

  def self.all_sellers
    where(role_id: 3).pluck(:email , :id)
  end
end
