class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    event_organiser?
    #only event_organiser
  end

  def update?
    record.user == user
    #only event_organiser
  end

  def destroy?
    record.user == user
    #only event_organiser
  end

 private

  def event_organiser?
    user.event_organiser
  end

end
