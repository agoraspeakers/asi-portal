class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    alias_action :create, :read, :update,           :to => :cru
    alias_action :create, :read, :update, :destroy, :to => :crud

    can :read, :all
    #case user.status
    #when "paid" do
      can :create, Club
    #end

    case user.role
    when "admin"
      can    :crud,    :all

      can    :confirm, Club, status: "requested"
      cannot :destroy, Club do |club|
        true # club.members.count > 8
      end
    end

    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
