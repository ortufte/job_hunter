class Task < ApplicationRecord
    belongs_to :opportunity

    #validates :description, presence: true 

    scope :urgent, -> { order(priority: :asc, created_at: :asc) }

    def complete?
        !!self.complete
    end

end
