class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Home

    return unless user.present?

    can(:manage, Group, user:)
    can :manage, Purchase, user:
  end
end
