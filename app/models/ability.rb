class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new(role: "guest")
    alias_action :create, :read, :update,           :to => :cru
    alias_action :create, :read, :update, :destroy, :to => :crud

    case user.role
    when "guest"
      can :read, Club

    when "admin"
      can    :crud,    :all
      can    :confirm, Club,       status: "requested"
      can    :confirm, Membership, status: "requested"

      registered_users(user)

      cannot :destroy, Club do |club|
        club.members.count >= 2
      end

    else # registered users
      can :read, :all
      registered_users(user)
    end


    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end

  def registered_users(user)
    #case user.status
    #when "paid" do
      can :create,  Club
      can :join,    Club do |club|
        user.memberships.pluck(:club_id).exclude?(club.id)
      end
    #end
    can :resign, Club do |club|
      user.memberships.pluck(:club_id).include?(club.id)
    end

    # can :confirm, Membership, status: "requested" do |membership|
    #   user.officer_in?(membership.club)
    # end
  end

end
