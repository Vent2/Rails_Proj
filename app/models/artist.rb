class Artist < ApplicationRecord
    has_many :stages
    has_many :raves, through: :stages
    accepts_nested_attributes_for :stages 
    
end
