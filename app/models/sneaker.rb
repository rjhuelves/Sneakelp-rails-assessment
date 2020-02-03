class Sneaker < ApplicationRecord
  belongs_to :brand
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  
  validates :model, presence: true
  validate :not_a_duplicate #single validate used when custom validator build in model. 


  def brand_attributes=(attributes)
    brand = Brand.find_or_create_by(attributes) if !attributes['name'].empty?
  end

  def not_a_duplicate 
    if Sneaker.find_by(model: model, colorway: colorway, brand_id: brand_id)
        errors.add(:model, 'and colorway has already been added for that brand.')
    end
  end 

  def model_and_brand
    "#{model} - #{brand.name}"
  end 
end
