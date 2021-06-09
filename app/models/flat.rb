class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :address, :description, :price_per_night, :number_of_guests, presence: true
  validates :number_of_guests, numericality: { only_integer: true }
  validates :price_per_night, numericality: true
end
