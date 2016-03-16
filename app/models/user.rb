class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  has_many :categories
  
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :name, :last_name, :email, :company_name, :description,   presence: true
  validates :name, length: { maximum: 20 }
 
  validates :last_name, :middle_name, :company_name,  length: { maximum: 40 }
end
