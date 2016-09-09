class ClubsController < ApplicationController
  load_and_authorize_resource
  respond_to :html

  def index
    respond_with(@clubs)
  end

  def show
    @members  = @club.memberships.with_confirmed_state
    @requests = @club.memberships.with_requested_state
    respond_with(@club)
  end

  def new
    @club = Club.new
    respond_with(@club)
  end

  def edit
  end

  def create
    @club = Club.new(club_params)
    @club.save
    respond_with(@club)
  end

  def update
    @club.update(club_params)
    respond_with(@club)
  end

  def destroy
    @club.destroy
    respond_with(@club)
  end

  def confirm
    @club.confirm!
    redirect_to club_path(@club), alert: "Club confirmed"
  end

private

  def club_params
    params.require(:club).permit(:name)
  end

end
