module DisplayHelper
  
  #index title management
  def mm_in(mm)
    (mm/25.4).round()
  end
  
  def kg_lbs(kg)
    (kg*2.2).round()
  end

end
