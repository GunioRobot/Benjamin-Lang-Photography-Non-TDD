class ProjectTypesController < ApplicationController
  def show
  	@type = ProjectType.find_by_name(params[:name])
  	@projs = @type.full_projects
  end

end