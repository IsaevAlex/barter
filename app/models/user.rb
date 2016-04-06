class User < ActiveRecord::Base
  acts_as_follower
  acts_as_followable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  belongs_to :category
  has_many :services

  has_many :sender_usered_orders, foreign_key: 'sender_user_id', class_name: 'Order'
  has_many :recipient_usered_orders, foreign_key: 'recipient_user_id', class_name: 'Order'
  
  has_many :favorite_services
  has_many :favorites, through: :favorite_services, source: :service
  
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :name, :last_name, :email, :company_name, :description,   presence: true
  validates :name, length: { maximum: 20 }
 
  validates :last_name, :middle_name, :company_name,  length: { maximum: 40 }
end
