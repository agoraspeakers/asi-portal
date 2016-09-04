class ClubsController < ApplicationController
  load_and_authorize_resource
  respond_to :html

  def index
    @clubs = Club.all
    respond_with(@clubs)
  end

  def show
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

private

  def club_params
    params.require(:club).permit(:name)
  end

end
