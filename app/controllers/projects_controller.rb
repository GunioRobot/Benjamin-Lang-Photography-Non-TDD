class ProjectsController < ApplicationController
  def show
  	@proj = Project.find(params[:id])
  end

end
