class Opportunity < ApplicationRecord
    belongs_to :user
    has_many :opportunity_qualifications
    has_many :qualifications, through: :opportunity_qualifications

    validates :title, :company,  presence: true

    def qualifications_attributes=(qualification_attributes)
        qualification_attributes.values.each do |qualification_attribute|
            new_qual = Qualification.find_or_create_by(qualification_attribute) if !qualification_attribute[:description].empty?
            if new_qual
                self.qualifications << new_qual
            end
        end
    end

end

