class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  belongs_to :manufacturer
  
  validates_presence_of :model,:category, :displacement
  
  def slug_candidates
    [
      [manufacturer.name, model],
      [manufacturer.name, model, displacement], 
      [manufacturer.name, model, displacement, Date.today.year]
    ]
  end 
  
  
  
end
