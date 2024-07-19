module LinksHelper
  
  #index title management
  def title(controller, suffix=0 )
    title = controller.titleize
    title = controller.split('/')[1].titleize if title.include?("/")
    link = controller.gsub('/', '_')
    page_title = content_tag(:h1, title, class: "display-6")
    link_new   = content_tag(:p, (link_to (content_tag(:i, "", class: 'fas fa-plus') + " New " + title), send("new_#{link.singularize}_path"), class: "btn btn-outline-dark new_button"), class: "link_right")
    suffix == "nonew" ? page_title : page_title + link_new
  end
  
  #admin action buttons
  def action_link(method, object, controller=0, prefix=0 )
    controller   = controller.gsub('/', '_').singularize
    record       = object.slug
    button_class = "btn btn-outline-dark btn-action"
    title = "#{method} #{controller}".titleize
    dataset = {toggle: "tooltip", placement: "left"}
    case
    when method == "show"
      link = link_to (content_tag(:i, "", class: 'fas fa-eye fa-xs') + ""), send("#{controller}_path", {id: record}), class: button_class, data: dataset , "title"=> title
    when method == "edit"
      link = link_to (content_tag(:i, "", class: 'fas fa-pencil-alt fa-xs') + ""), send("edit_#{controller}_path", {id: record}), class: button_class, data: dataset, "title"=> title
    when method == "delete"
      link = link_to (content_tag(:i, "", class: 'far fa-trash-alt fa-xs') + ""), send("#{controller}_path", {id: record}), data: { confirm: 'Are you sure?' }, method: :delete, class: button_class, "title"=>title
    when method == "pdf"
      link = link_to (content_tag(:i, "", class: 'fas fa-file-pdf') + ""), send("#{prefix}_#{controller}_path", {id: record, format: "pdf"}), class: button_class, data: dataset, "title"=> title
    when method == "inspect"
      link = []
      link << controller.inspect
      link << object.class.name.downcase
    else
      ""
    end
    link
  end
  

end
