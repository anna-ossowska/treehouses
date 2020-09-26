class Treehouse < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :address, :description, presence: true
  validates :beds, :capacity, :price_per_night, presence: true, numericality: { only_integer: true }

  # for cloudinary
  has_many_attached :photos
end
