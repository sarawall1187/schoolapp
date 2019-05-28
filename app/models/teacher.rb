class Teacher < ApplicationRecord
    belongs_to :school
    has_many :children
    has_many :parents, through: :children

    validates :name, presence: true
    validates :grade_taught, presence: true

    scope :order_by_grade, -> { order(grade_taught: :asc) }
    scope :order_by_name, -> { order(name: :asc) }

    def name_and_grade
        "#{self.name}, #{self.grade_taught.ordinalize} grade"
    end

end
