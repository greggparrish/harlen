class PressitemPolicy < ApplicationPolicy
  def index?
    true
  end
 
  def create?
    user.present?
  end
 
  def update?
    return true if user.present? && user.admin?
  end
 
  def destroy?
    return true if user.present? && user.admin?
  end
 
  private
 
    def pressitem
      record
    end
end
