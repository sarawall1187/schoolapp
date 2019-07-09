class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :name, :grade_taught, :school_id

  belongs_to :school
  has_many :children

end
