class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable ,:registerable, :confirmable
  has_many :addresses 
  has_many :products
  has_many :feedbacks
  has_many :orders
  has_one :store
  has_one :shopping_cart
  has_one :role
  has_one_attached :avatar

  def self.all_sellers
    where(role_id: 3).pluck(:email , :id)
  end

  before_create :default_role
  def default_role
    if self.role_id == nil
      self.role_id = 2
    end
  end

  def store_products
    self.store.products
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end



end
