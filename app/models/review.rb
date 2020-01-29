class Review < ApplicationRecord
  belongs_to :user
  belongs_to :sneaker

  validates :title, presence: true 
  validates :ratings, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}
end
