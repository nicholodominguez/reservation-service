class ReservationParserService
  def initialize(payload)
    @payload = payload
  end

  def parse
    return airbnb_obj if from_airbnb?
    return booking_obj if from_booking?
  end

private
  def from_airbnb?
    @payload["guest"].present?
  end

  def airbnb_obj
    {
      id: @payload["guest"].try(:[], "id"),
      first_name: @payload["guest"].try(:[], "first_name"),
      last_name: @payload["guest"].try(:[], "last_name"),
      email: @payload["guest"].try(:[], "email"),
      phone_numbers: [ @payload["guest"].try(:[], "phone") ],
      reservations_attributes: [{
        start_date: Time.zone.strptime(@payload["start_date"], "%Y-%m-%d"),
        end_date: Time.zone.strptime(@payload["end_date"], "%Y-%m-%d"),
        nights: @payload["nights"].to_i,
        guests: @payload["guests"].to_i,
        adults: @payload["adults"].to_i,
        children: @payload["children".to_i],
        infants: @payload["infants"].to_i,
        status: @payload["status"],
        currency: @payload["currency"],
        payout_price: @payload["payout_price"].to_f,
        security_price: @payload["security_price"].to_f,
        total_price: @payload["total_price"].to_f,
        description: @payload["description"],
      }]
    }
  end

  def from_booking?
    @payload["reservation"].present?
  end

  def booking_obj
    reservation = @payload["reservation"]
    return nil if reservation.blank?

    {
      id: reservation["guest_id"],
      first_name: reservation["guest_first_name"],
      last_name: reservation["guest_last_name"],
      email: reservation["guest_email"],
      phone_numbers: reservation["guest_phone_numbers"],
      reservations_attributes: [{
        start_date: Time.zone.strptime(reservation["start_date"], "%Y-%m-%d"),
        end_date: Time.zone.strptime(reservation["end_date"], "%Y-%m-%d"),
        nights: reservation["nights"].to_i,
        guests: reservation["number_of_guests"].to_i,
        adults: reservation["guest_details"].try(:[], "number_of_adults").to_i,
        children: reservation["guest_details"].try(:[], "number_of_children").to_i,
        infants: reservation["guest_details"].try(:[], "number_of_infants").to_i,
        description: reservation["guest_details"].try(:[], "localized_description"),
        status: reservation["status_type"],
        currency: reservation["host_currency"],
        payout_price: reservation["expected_payout_amount"].to_f,
        security_price: reservation["listing_security_price_accurate"].to_f,
        total_price: reservation["total_paid_amount_accurate"].to_f
      }]
    }
  end
end