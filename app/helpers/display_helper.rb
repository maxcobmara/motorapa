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
  
  def sig_zero(amount=0)
    sprintf('%g', amount) 
  end  
  
  
  def table_data(object, suffix=0, formatter=0)
    class_name = "table-danger" if object.blank?
    #object = "No data" if object.blank?
    object = object.to_s + " " + suffix.to_s if suffix != 0
    if formatter!=0
      content_tag(:td, eval("#{formatter}(#{object})"), class: class_name)
    else
      content_tag(:td, object, class: class_name)
    end
  end
  #[class="#{class_names("table-danger": product.engine_card.blank?)}"] = product.engine_card

end
