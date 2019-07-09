class School < ApplicationRecord
    has_many :teachers
    has_many :children, through: :teachers

    validates :name, presence: true

    def self.format_date
        self.created_at..strftime("%Y-%m-%d")
    end
end
