class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  stale_when_importmap_changes

  def route_not_found
    # OPTION A: Render the standard public 404.html page (Recommended for SEO/HTTP spec)
    render file: Rails.public_path.join("404.html"), status: :not_found, layout: false

    # OPTION B: Or redirect to root path with a flash message
    # redirect_to root_path, alert: "The page you were looking for doesn't exist."
  end
end
