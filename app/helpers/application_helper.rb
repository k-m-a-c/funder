module ApplicationHelper

  def show_search?
    if params[:controller] === "organizations" &&
     params[:action] === "index"

      true

    elsif params[:controller] === "ridings" &&
      params[:action] === "index"

      true

    elsif params[:controller] === "ridings" &&
      params[:action] === "organizations"

      true
    end
  end


  def search_routing
    if params[:controller] === "organizations"
      org_search_path
    elsif params[:controller] === "ridings"
      riding_search_path
    end
  end

end
