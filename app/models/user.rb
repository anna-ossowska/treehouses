class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :treehouses # through: :bookings <---- will need this eventually for bookings?
  has_many :bookings, dependent: :destroy

  validates :first_name, :last_name, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }, uniqueness: true

  # for cloudinary img upload
  has_one_attached :photo
end
