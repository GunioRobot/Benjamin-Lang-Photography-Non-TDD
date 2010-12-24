class ProjectsController < ApplicationController
  def show
  	@proj = Project.find(params[:id])
  	if !@proj.photos.empty?
  		redirect_to project_photo_path(@proj,@proj.photos.find(:first, :order => 'display_order'))
  	end
  end

end
