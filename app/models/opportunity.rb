class Opportunity < ApplicationRecord
    belongs_to :user
    has_many :opportunity_qualifications
    has_many :qualifications, through: :opportunity_qualifications
    has_many :tasks

    validates :title, :company,  presence: true

    accepts_nested_attributes_for :tasks, :reject_if => proc { |attributes| attributes['description'].blank? }

    def qualifications_attributes=(qualification_attributes)
        qualification_attributes.values.each do |qualification_attribute|
            new_qual = Qualification.find_or_create_by(qualification_attribute) if !qualification_attribute[:description].empty?
            if new_qual
                self.qualifications << new_qual
            end
        end
    end



end

