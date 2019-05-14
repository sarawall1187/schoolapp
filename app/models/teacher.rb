class Teacher < ApplicationRecord
    belongs_to :school
    has_many :children
    has_many :parents, through: :children
end
