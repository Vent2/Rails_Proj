class Artist < ApplicationRecord
    has_many :bookings
    has_many :raves, through: :bookings

end
