class Api::V1::GuestsController < ActionController::API
  def create
    rps = ReservationParserService.new(params)
    guest = Guest.new(rps.parse)

    if guest.save
      render json: { guest: guest, reservation: guest.reservations }
    else
      render  json: { errors: guest.errors.full_messages.join(". ") },
              status: :unprocessable_entity
    end
  end
end