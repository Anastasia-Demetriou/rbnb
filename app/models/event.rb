class Event < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :user
  has_many :bids
  has_one :booking, through: :bids

  validates_presence_of :name, :date, :event_type, :location, :description, :party_size, :service, :min_price, :max_price
end
