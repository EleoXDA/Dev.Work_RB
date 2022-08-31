class BookingsController < ApplicationController
  def create
    @challenge = Challenge.find(params[:challenge_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.challenge = @challenge
    if @booking.save
      redirect_to challenge_path(@challenge), notice: "Offer has been made..."
    else
      render 'challenges/show', status: :unprocessable_entity, locals: {'@bookings': @challenge.bookings}
    end
  end

  # def review
  #   @booking = Booking.find(params[:id])
  #   @challenge = Challenge.find(params[:challenge_id])
  # end

  private

  def booking_params
    params.require(:booking).permit(:date, :price)
  end
end
