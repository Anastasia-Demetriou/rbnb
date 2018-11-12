class Bid < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_one :booking

  validates_presence_of :price
end
