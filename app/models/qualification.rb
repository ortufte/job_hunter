class Qualification < ApplicationRecord
    has_many :opportunities
    has_many :user_qualifications
    has_many :users, through: :user_qualifications
    
    validates :description, presence: true, uniqueness: true
end
