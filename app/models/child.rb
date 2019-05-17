class Child < ApplicationRecord
    belongs_to :parent
    belongs_to :teacher, optional: true

    validates :name, presence: true
    validates :age, presence: true
end
