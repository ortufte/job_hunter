class Task < ApplicationRecord
    belongs_to :opportunity

    validates :description, presence: true 

    scope :urgent, -> (limit) { order(priority: :asc, created_at: :asc).limit(limit) }

    def complete?
       if !!self.complete
        "Complete"
       elsif !self.complete
        "Incomplete"
       end
    end


end
