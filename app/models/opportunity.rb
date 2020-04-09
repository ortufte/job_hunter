class Opportunity < ApplicationRecord
    belongs_to :user
    has_many :qualifications

    validates :title, :company,  presence: true
end
