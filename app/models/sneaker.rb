class Sneaker < ApplicationRecord
  belongs_to :brand
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  
  validates :model, presence: true
  validate :not_a_duplicate #single validate used when custom validator build in model. 

  scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(rating) desc')}
  #combine sneakers and reviews tables, groups reviews by id, then average the rating of the group

  def self.alpha
    order(model: :asc)
  end 

  def brand_attributes=(attributes)
    brand = Brand.find_or_create_by(attributes) if !attributes['name'].empty?
  end

  def not_a_duplicate 
    if Sneaker.find_by(model: model, colorway: colorway, brand_id: brand_id)
        errors.add(:model, 'and colorway has already been added for that brand.')
    end
  end 

  def model_colorway_brand
    "#{model} (#{colorway})- #{brand.name}"
  end 
end
