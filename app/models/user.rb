class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_sneakers, through: :reviews, source: :sneaker
    has_many :sneakers #sneaker that user has created 

    validates :username, :email, uniqueness: true, pressence: true 
    has_secure_password 
end
