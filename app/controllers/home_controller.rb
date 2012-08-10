class HomeController < ApplicationController
  
  layout "home"
  
  def index
    redirect_to user_path(current_user.id) unless current_user.blank?
  end
end
