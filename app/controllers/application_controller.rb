class ApplicationController < ActionController::Base
  require 'cancan'
  require 'will_paginate/array'
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end

  
end
