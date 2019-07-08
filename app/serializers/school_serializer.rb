class SchoolSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :teachers
end
