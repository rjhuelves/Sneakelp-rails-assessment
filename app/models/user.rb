class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_sneakers, through: :reviews, source: :sneaker
    has_many :sneakers #sneaker that user has created 

    validates :username, :email, uniqueness: true, presence: true 

    has_secure_password 

    # def self.create_by_google_omniauth(auth)
    #     self.find_or_create_by(username: auth[:info][:email]) do |u|
    #         u.password = SecureRandom.hex
    #     end
    # end

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
            user.username = auth.info.name
            user.email = auth.info.email
            user.password = SecureRandom.hex
        end
    end

end
