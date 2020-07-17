class Rave < ApplicationRecord
    belongs_to :user
    has_many :stages
    has_many :artists, through: :stages
end
