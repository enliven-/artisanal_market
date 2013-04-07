class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource)
    if resource.is_a? Customer
      projects_path 
    else 
      index_artisan_projects_path
    end
  end
  
end
