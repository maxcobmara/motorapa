class Manufacturer < ApplicationRecord
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_one_attached :logo
  
  has_many :products
end
