class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
 
    if user.role? :admin
      can :manage, :all
   
    elsif user.role? :editor
      can :manage, [Snippet, JobOffer]
   
    elsif user.role? :registered
      can [:create, :read], [Snippet]

      can :manage, Snippet do |snippet|
        snippet.try(:user) == user
      end

    else
      can :read, :all
    end
  end
end