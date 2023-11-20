# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    user ||= User.new
    can :read, User
    can :read, Group
    can :read, Operation
    can :manage, Group, author_id: user.id
    can :manage, Group, author_id: user.id
    can :manage, Group if user.is? :admin
    can :manage, Operation if user.is?
  end
end
