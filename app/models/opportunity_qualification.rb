class OpportunityQualification < ApplicationRecord
    belongs_to :opportunity 
    belongs_to :qualification
end
