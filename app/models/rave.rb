class Rave < ApplicationRecord
    belongs_to :user
    has_many :artists
    has_many :songs, through: :artist
end
