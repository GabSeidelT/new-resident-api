# frozen_string_literal: true

class Ability
    include CanCan::Ability
    
    def initialize(user)      
      
      
      can :manage, :all
      
      # Parte abaixo comentada para testes.

      # All permissions
      # can :read, :all
      
      # Admin permissions
      # if user.admin?
      #   can :manage, :all
      # end

      # # User controller permissions
      # can :create, User
      # can [:read, :edit, :delete], User, user_id: user.id

      # # Report controller permissions
      # can :create, Report
      # can :read, Report, :all
      # can [:edit, :delete], Report, resident_id: user.resident_id
      
    end
  
end
  