class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_sneakers, through: :reviews, source: :sneaker

    has_many :sneakers #sneaker that user has created 
end
