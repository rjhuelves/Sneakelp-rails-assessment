class Brand < ApplicationRecord
    has_many :sneakers 
    validates :model, presence: true, uniqueness: true 
end
