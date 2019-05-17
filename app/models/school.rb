class School < ApplicationRecord
    has_many :teachers
    has_many :children, through: :teachers

    validates :name, presence: true
end
