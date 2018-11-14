class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :bids, dependent: :destroy
  has_many :bookings, through: :bids, dependent: :destroy

  validates_presence_of :first_name, :last_name, :password
  validates :email, uniqueness: { case_sensitive: false }
  validates :service, presence: true, if: :is_professional?


  def is_professional?
    professional
  end
end
