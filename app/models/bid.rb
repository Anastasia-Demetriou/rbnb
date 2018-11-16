class Bid < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_one :booking
  has_one :accepted

  validates_presence_of :price
end
