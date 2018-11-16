class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  #def resolve
   #   scope.joins(bid: :event).where(bid: { event: { user: user } } )
    #end
  #end

  def show?
    record.user == user
  end

end
