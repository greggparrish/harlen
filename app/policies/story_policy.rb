class StoryPolicy < ApplicationPolicy
  attr_reader :user, :story
  def initialize(user, story)
    @user = user
    @story = story
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

  def set_story?
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

