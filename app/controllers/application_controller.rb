class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

 def after_sign_in_path_for(resource)
       if resource.class == Admin
      console_path
    end 
  end



end
