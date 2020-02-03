class Review < ApplicationRecord
  belongs_to :user
  belongs_to :sneaker

  validates :title, presence: true 
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}
  validates :sneaker, uniqueness: {scope: :user, message: "you have already given a review for this sneaker"}

end
