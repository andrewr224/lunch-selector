class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Menu if user.admin?
    can :manage, Order, user_id: user.id
    can :read, :all
  end
end
