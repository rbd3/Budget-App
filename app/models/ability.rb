# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    user ||= User.new
    can :read, User
    can :read, Group
    can :read, Operation

    can :manage, Group, user_id: user.id
    can :manage, Operation, group: { user_id: user.id }

    if user.admin?
      can :manage, :all
    end
    
  end
end
