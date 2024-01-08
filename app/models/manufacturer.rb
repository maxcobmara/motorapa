class Manufacturer < ApplicationRecord
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :products
end
