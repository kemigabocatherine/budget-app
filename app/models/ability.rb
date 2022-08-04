# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
      can :read , Home

      return unless user.present?
      can :manage, Group, user: user
      can :manage, Purchase, user: user
  end
end
