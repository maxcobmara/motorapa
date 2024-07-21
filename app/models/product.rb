class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  
  has_one_attached :profile_pic
  belongs_to :manufacturer
  
  validates_presence_of :model,:category, :displacement
  
  before_save :calc_range
  
  
  serialize :data, Hash
  
  def slug_candidates
    [
      [manufacturer.name, model],
      [manufacturer.name, model, displacement], 
      [manufacturer.name, model, displacement, Date.today.year]
    ]
  end 
  
  scope :license_search, -> (q) { 
    case q
    when "B2"
      where("displacement <= ?", 250)
    when "B"
      where("displacement > ?", 250)
    else
    end
  }
  
  # ...
 #def self.ransackable_attributes(auth_object = nil)
 #["additional_features", "assembled_in", "battery_size", "brake_front_desc", "brake_rear_desc", "category", "clutch", "consumption_lkm", "created_at", "cyl_bore", "cyl_stroke", "cyl_valves", "cylinders", "data", "displacement", "drive_category", "engine_description", "fuel", "fuel_capacity_l", "gears", "ground_clearance_mm", "height_mm", "id", "kerb_weight_kg", "length_mm", "manufacturer_category", "manufacturer_id", "max_power_ps", "max_power_rpm", "max_torque_nm", "max_torque_rpm", "model_code", "oil_capacity_l", "range_km", "seat_height_mm", "slug", "suspension_front", "suspension_rear", "topspeed_km", "transmission", "tube", "tyre_category", "tyre_front", "tyre_rear", "updated_at", "wheel_front_in", "wheel_rear_in", "wheelbase_mm", "width_mm"]
 #end
 # ...
 
  def self.ransackable_attributes(auth_object = nil)
    ["category", "displacement", "license_search", "manufacturer_id", "rrp", "model", "manufacturers.name", "cylinders", 
     "max_power_ps", "fuel_capacity_l", "seat_height_mm"]
  end
  
  def self.ransackable_scopes(auth_object = nil)
    [:license_search]
  end
  
  def self.ransackable_associations(auth_object = nil)
  ["manufacturer"]
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
  
  def calc_range
    if fuel_capacity_l.to_f > 0 && consumption_lkm.to_f > 0 && range_km.blank?
      self.range_km = ((fuel_capacity_l / consumption_lkm)*100).to_i
    end
  end
  
  #strip commas from fields
  def rrp=(rrp)
     self[:rrp] = rrp.to_s.tr('^0-9.-', '')
  end
  def length_mm=(length_mm)
     self[:length_mm] = length_mm.to_s.tr('^0-9.-', '')
  end
  def height_mm=(height_mm)
     self[:height_mm] = height_mm.to_s.tr('^0-9.-', '')
  end
  def wheelbase_mm=(wheelbase_mm)
     self[:wheelbase_mm] = wheelbase_mm.to_s.tr('^0-9.-', '')
  end
  def displacement=(displacement)
     self[:displacement] = displacement.to_s.tr('^0-9.-', '')
  end
  
  def max_power_rpm=(max_power_rpm)
     self[:max_power_rpm] = max_power_rpm.to_s.tr('^0-9.-', '')
  end
  def max_torque_rpm=max_torque_rpm
     self[:max_torque_rpm] = max_torque_rpm.to_s.tr('^0-9.-', '')
  end
  
  
  
  
  
  #strip whitespace
  def tyre_front=(tyre_front)
     self[:tyre_front] = tyre_front.gsub(" ", "")
  end
  
  def tyre_rear=(tyre_rear)
     self[:tyre_rear] = tyre_rear.gsub(" ", "")
  end
  
  
  
  


  
end
