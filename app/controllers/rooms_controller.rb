class RoomsController < ApplicationController
  before_action :set_user, except: [:search]
  before_action :set_room, only: [:show]

  def index
    @rooms = @user.rooms
  end

  def search
    @keyword = params[:keyword]
    @rooms = Room.search(@keyword)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user = @user

    if @room.save
      flash[:success] = "施設を登録しました"
      redirect_to rooms_path
    else
      flash[:error] = "施設を登録できませんでした"
      render "new"
    end
  end

  def show
    @reservation = Reservation.new
  end

  private

  def set_user
    @user = current_user
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:room_name, :room_image, :introduction, :price, :address)
  end
end
