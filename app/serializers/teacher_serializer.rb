class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :name, :grade_taught

  belongs_to :school
  has_many :children

end
