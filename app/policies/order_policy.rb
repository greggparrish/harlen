class OrderPolicy < ApplicationPolicy
  attr_reader :user, :order
  def initialize(user, order)
    @user = user
    @order = order
  end 

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        order.where(user_id: @user_id)
      end
    end
  end

  def index?
    @user.orders.where(order_status_id: 1).exists?
  end

  def show?
    true
  end

  def update?
    @order.exists?(user_id: @user)
  end
 
  def destroy?
    return false if @current_user == @user
    @current_user.admin?
  end
 
end


