class Child < ApplicationRecord
    belongs_to :parent
    belongs_to :teacher, optional: true
end
