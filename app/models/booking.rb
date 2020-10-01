class Booking < ApplicationRecord
  belongs_to :treehouse
  belongs_to :user

  validates :check_in, :check_out, presence: true, availability: true
  validate :end_date_after_start_date
  validates :number_of_guests, presence: true, numericality: { only_integer: true }
  validates_uniqueness_of :user_id, scope: :treehouse_id

private

  def end_date_after_start_date
    return if check_out.blank? || check_in.blank?

    if check_out < check_in
      errors.add(:check_out, "must be after the check in date")
    end
 end


  # validates_uniqueness_of :user_id, scope: :treehouse_id <---- commented out for now so you can book multiple treehouses

end
