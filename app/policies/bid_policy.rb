class BidPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    professional?
  end

  def show?
    record.user == user || record.event.user == user
  end

  def update?
    record.user == user
  end

  def create?
    professional?
  end

  def destroy?
    record.user == user
  end


  private

  def professional?
    user.professional
  end
end
