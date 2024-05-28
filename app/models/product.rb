class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  
  has_one_attached :profile_pic
  belongs_to :manufacturer
  
  validates_presence_of :model,:category, :displacement
  
  serialize :data, Hash
  
  def slug_candidates
    [
      [manufacturer.name, model],
      [manufacturer.name, model, displacement], 
      [manufacturer.name, model, displacement, Date.today.year]
    ]
  end 
  
  
  def engine_card=(value)
    data[:engine_card] = value
  end
  def engine_card
    data[:engine_card]
  end
  
  
  
  
  
end
