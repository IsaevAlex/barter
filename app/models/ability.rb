class Ability
  include CanCan::Ability

  def initialize(user)
     user ||= User.new

     can :create, User, id: user.id

     can :update, Service do | service |
         service.user == user
     end  

     can :destroy, Service do | service |
         service.user == user
     end
  end
end
