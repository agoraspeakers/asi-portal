class PagesController < ApplicationController
  def index
    @user_count = User.count
    @club_count = Club.count
    @confirmed_clubs_count = Club.with_confirmed_state.count
  end
end
