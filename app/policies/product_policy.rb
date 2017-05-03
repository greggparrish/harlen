class ProductPolicy < ApplicationPolicy
  attr_reader :user, :product
  def initialize(user, product)
    @user = user
    @product = product
  end 

  class Scope < Scope
    def resolve
      scope.all
    end 
  end 

  def index?
    true
  end

  def show?
    true
  end

  def set_product?
    true
  end

  def edit?
    @user && @user.admin?
  end
 
  def create?
    @user && @user.admin?
  end
 
  def update?
    @user && @user.admin?
  end
 
  def destroy?
    @user && @user.admin?
  end
 
end

