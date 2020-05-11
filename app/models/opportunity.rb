class Opportunity < ApplicationRecord
    belongs_to :user
    has_many :opportunity_qualifications
    has_many :qualifications, through: :opportunity_qualifications
    has_many :tasks

    validates :title, :company,  presence: true

    accepts_nested_attributes_for :tasks, :reject_if => proc { |attributes| attributes['description'].blank? }
    accepts_nested_attributes_for :qualifications, :reject_if => proc { |attributes| attributes['description'].blank? }

    def closed?
        if !!self.closed
         "Closed"
        elsif !self.closed
         "Current"
        end
     end

end

