class Admin::ProjectsController < ApplicationController
	def show
  	@proj = Project.find(params[:id])
  	@thumb_classes = ["thumb_container first_thumb","thumb_container","thumb_container last_thumb"]
  end
  
  def empty
  end
  
end
