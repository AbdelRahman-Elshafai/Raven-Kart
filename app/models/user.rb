class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable ,:registerable, :confirmable
  has_many :products
  has_many :feedbacks
  has_many :orders
  has_one :store
  has_one :shopping_cart
  has_one :role
  has_one_attached :avatar

  validates :name , presence: true , length: { in: 3..20}
  validates :address , presence: true
  validates :email , presence: true , format: Devise.email_regexp
  validates :avatar, attached: true

  def self.all_sellers
    where(role_id: 3).pluck(:email , :id)
  end

  before_create :default_role, :skip_admin_confirmation
  after_create :create_user_cart
  def default_role
    if self.role_id == nil
      self.role_id = 2
    end
  end

  def create_user_cart
    ShoppingCart.new(:user_id => self.id).save
  end

  def store_products
    self.store.products
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def skip_admin_confirmation
    if role_id == 1
      skip_confirmation!
    end
  end


end
