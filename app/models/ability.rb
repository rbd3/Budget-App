class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    user ||= User.new
    can :read, User
    can :read, Group
    can :read, Operation

    return unless user.present?

    can :manage, Group do |group|
      group.user == user
    end
  end
end
