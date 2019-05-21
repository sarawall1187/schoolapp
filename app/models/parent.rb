class Parent < ApplicationRecord
    has_secure_password
    has_many :children, dependent: :destroy
    has_many :teachers, through: :children

    validates :email, presence: true
    validates :email, uniqueness: true

    def self.find_or_create_by_omniauth(auth_hash)
      oauth_email = auth_hash['info']['email']
      #logged in with FB before
      if @parent = Parent.find_by(email: oauth_email)
          @parent
      else
          #logged in with FB first time
          @parent = Parent.create(email: oauth_email, password: SecureRandom.hex)
      end
    end
    
end
