class User < ApplicationRecord
  attr_reader :event_organiser
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :bids
  has_many :bookings, through: :bids

  validates_presence_of :first_name, :last_name, :password, :event_organiser
  validates :email, uniqueness: { case_sensitive: false }
  validates :service, presence: true, if: :is_event_organiser?


  def is_event_organiser?
    event_organiser == false
  end
end
