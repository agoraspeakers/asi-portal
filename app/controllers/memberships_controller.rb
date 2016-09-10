class MembershipsController < ApplicationController
  respond_to :html

  def join
    @membership = Membership.new(membership_params)
    authorize! :join, @membership.club
    @membership.save
    respond_with(@membership.club)
  end

  def confirm
    @membership = Membership.find_by!(membership_params)
    authorize! :confirm, @membership
    @membership.update_attributes(status: "confirmed")
    respond_with(@membership.user)
  end

  def resign
    @membership = Membership.find_by!(membership_params)
    authorize! :resign, @membership.club
    @membership.destroy
    respond_with(@membership.user)
  end

private
  def membership_params
    params.permit(:user_id, :club_id)
  end
end
