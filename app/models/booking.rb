class Booking < ApplicationRecord
  belongs_to :treehouse
  belongs_to :user

  validates :check_in, :check_out, presence: true
  validates :number_of_guests, presence: true, numericality: { only_integer: true }
  # validates_uniqueness_of :user_id, scope: :treehouse_id <---- commented out for now so you can book multiple treehouses
end
