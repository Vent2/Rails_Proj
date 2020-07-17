class Rave < ApplicationRecord
    belongs_to :user
    has_many :bookings
    has_many :artists, through: :bookings
end
