class User < ApplicationRecord
    has_secured_password
    validates_pressence_of :name, :email, :password_digest
    validates_uniquness :email

    has_many :raves
    has_many :artists, through: :raves
    has_many :songs, through: :artists


    def self.find_by_or_create_by_omniauth(auth_hash)
        self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end
end
