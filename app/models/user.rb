class User < ApplicationRecord
    
    has_secure_password
    
    validates_presence_of :email, :password
    validates_uniqueness_of :email

    has_many :raves
    has_many :artists, through: :raves
    has_many :songs, through: :artists


    def self.find_by_or_create_by_omniauth(auth_hash)
        self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
            user.name = auth_hash['info']['name']
            user.password = SecureRandom.hex
        end
    end
end

