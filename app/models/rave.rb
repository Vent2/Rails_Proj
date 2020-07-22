class Rave < ApplicationRecord
    belongs_to :user
    has_many :stages
    has_many :artists, through: :stages

    scope :cheap?, -> { where("price <= 500" ) }

    def cheap?
        self.price <= 500
    end

end
