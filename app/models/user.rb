class User < ApplicationRecord
    has_secure_password
    validates :email, :username, presence: true, uniqueness: true
    has_many :recipes
    has_many :reviews
    has_many :reviewed_recipes, through: :reviews, source: :recipe

    def self.create_from_omniauth(auth)
        self.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(16)
        end
    end
end
