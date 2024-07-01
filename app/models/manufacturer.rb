class Manufacturer < ApplicationRecord
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_one_attached :logo
  
  has_many :products
  
  def self.ransackable_attributes(auth_object = nil)
    ["country", "name", "id"]
  end
end
