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
  
  scope :license_search, -> (q) { where("displacement < ?", 250) if q == "B2"}
  
  # ...
 #def self.ransackable_attributes(auth_object = nil)
 #["additional_features", "assembled_in", "battery_size", "brake_front_desc", "brake_rear_desc", "category", "clutch", "consumption_lkm", "created_at", "cyl_bore", "cyl_stroke", "cyl_valves", "cylinders", "data", "displacement", "drive_category", "engine_description", "fuel", "fuel_capacity_l", "gears", "ground_clearance_mm", "height_mm", "id", "kerb_weight_kg", "length_mm", "manufacturer_category", "manufacturer_id", "max_power_ps", "max_power_rpm", "max_torque_nm", "max_torque_rpm", "model", "model_code", "oil_capacity_l", "range_km", "rrp", "seat_height_mm", "slug", "suspension_front", "suspension_rear", "topspeed_km", "transmission", "tube", "tyre_category", "tyre_front", "tyre_rear", "updated_at", "wheel_front_in", "wheel_rear_in", "wheelbase_mm", "width_mm"]
 #end
 # ...
 
  def self.ransackable_attributes(auth_object = nil)
    ["category", "displacement", "license_search"]
  end
  
  def self.ransackable_scopes(auth_object = nil)
    [:license_search]
  end
  
  
  def engine_card=(value)
    data[:engine_card] = value
  end
  def engine_card
    data[:engine_card]
  end
  
  def self.license_search_old(query)
    if query == "B2"
      #search for own group
      Product.where("displacement < ?", 250)
    elsif query == "B"
      #search for non own group
      Product.all
    end
  end
  
  
  
  
  
end
