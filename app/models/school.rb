class School < ApplicationRecord
    has_many :teachers
    has_many :children, through: :teachers
end
