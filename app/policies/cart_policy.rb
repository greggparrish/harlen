class CartPolicy < ApplicationPolicy
  attr_reader :user, :cart
  def initialize(user, cart)
    @user = user
    @cart = cart
  end 

  class Scope < Scope
    def resolve
      scope.where(user_id: @user)
    end 
  end 

  def index?
    @cart.exists?(user_id: @user)
  end

  def show?
    @cart.exists?(user_id: @user)
  end

  def update?
    @cart.exists?(user_id: @user)
  end
 
  def destroy?
    return false if @current_user == @user
    @current_user.admin?
  end
 
end


