class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:new, :create]
  
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.room = @room
  
    if @reservation.save
      redirect_to room_path(@room), notice: '予約が完了しました。'
    else
      ender :new
    end
  end

  def index
     @reservations = current_user.reservations
  end
  
   private

  def set_room
     @room = Room.find(params[:room_id])
  end
  
  def reservation_params
   params.require(:reservation).permit(:check_in, :check_out, :guests_count)
  end
end

  