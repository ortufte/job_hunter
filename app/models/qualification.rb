class Qualification < ApplicationRecord
    validates :description, presence: true, uniqueness: true
end
