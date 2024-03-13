module DisplayHelper
  
  #index title management
  def mm_in(mm)
    (mm.to_i/25.4).round()
  end
  
  def kg_lbs(kg)
    (kg.to_i*2.2).round()
  end

end
