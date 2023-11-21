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

    return unless user.admin?

    can :manage, :all
  end
end
