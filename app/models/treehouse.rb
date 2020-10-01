class Treehouse < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, :address, :description, presence: true
  validates :beds, :capacity, :price_per_night, presence: true, numericality: { only_integer: true }

  # for cloudinary
  has_many_attached :photos

  # for geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  scope :search, lambda { |params|
    result = all
    capacity = params['capacity']
    result = where("capacity >= ?", capacity) if capacity
    # code for search on address below, will check this once we have bookings
    # includes(:bookings).merge(Booking.where('check_out <= ? AND check_in >= ?', params[:check_in], params[:check_in]).or.where( 'check_out <= ? AND check_in >= ?', params[:check_in], params[:check_out]))
  }

end
