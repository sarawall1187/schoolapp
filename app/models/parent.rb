class Parent < ApplicationRecord
    has_secure_password
    has_many :children
    has_many :teachers, through: :children

    validates :email, presence: true
    validates :email, uniqueness: true
    
end
