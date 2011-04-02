class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_project_types
  
  def get_project_types
  	@PTs= ProjectType.find(:all, :order => 'display_order')
  end
end