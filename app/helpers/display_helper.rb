module DisplayHelper
  
  #index title management
  def mm_in(mm)
    (mm.to_i/25.4).round()
  end
  
  def kg_lbs(kg)
    (kg.to_i*2.2).round()
  end
  
  def price(rrp) 
    number_to_currency(rrp, unit: "MYR ", delimiter: ",",  precision: 2)
  end
  
  def price_s(rrp) 
    number_to_currency(rrp, unit: "RM ", delimiter: "",  precision: 0)
  end

end
