class V1::Me::ReservationsController < ApplicationController
  def index
    @reservations = @current_user.reservations
    if @reservations.empty?
      render json: { error: 'No Reservations!' }, status: 200
    else
      render json: @reservations.to_json(include: :car)
    end
  end

  def create
    @myreservation = @current_user.reservations.new(reservation_params)
    if @myreservation.save
      render json: @myreservation
    else
      render json: { success: false, errors: 'Oops something went wrong' }, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(:city, :date, :car_id)
  end
end
