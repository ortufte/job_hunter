class Opportunity < ApplicationRecord
    belongs_to :user
    has_many :opportunity_qualifications
    has_many :qualifications, through: :opportunity_qualifications

    validates :title, :company,  presence: true
end
