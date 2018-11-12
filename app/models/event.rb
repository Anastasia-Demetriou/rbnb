class Event < ApplicationRecord
  belongs_to :user
  has_many :bids
  has_one :booking, through: :bids

  validates_presence_of :name, :date, :type, :location, :description, :party_size, :service, :price_range
end
