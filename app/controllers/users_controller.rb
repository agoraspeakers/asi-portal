class UsersController < ApplicationController
  load_and_authorize_resource
  respond_to :html

  def index
    respond_with(@users)
  end

  def show
    @clubs_requested = @user.memberships.with_requested_state
    @clubs_confirmed = @user.memberships.with_confirmed_state
    respond_with(@user)
  end
end
