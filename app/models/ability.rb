class Ability
  include CanCan::Ability

  def initialize(user)
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
