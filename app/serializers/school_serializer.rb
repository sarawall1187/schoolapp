class SchoolSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at

  has_many :teachers
end
