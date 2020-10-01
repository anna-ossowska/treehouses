class AvailabilityValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    bookings = Booking.where(["treehouse_id =?", record.treehouse_id])
    date_ranges = bookings.map { |b| b.check_in..b.check_out }

    date_ranges.each do |range|
      if range.include? value
        record.errors.add(attribute, "not available")
      end
    end
  end
end
