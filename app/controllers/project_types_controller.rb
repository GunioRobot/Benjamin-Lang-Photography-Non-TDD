class ProjectTypesController < ApplicationController
  def show
  	@type = ProjectType.find_by_name(params[:name])
  	@projs = @type.projects.order('display_order')
  end

end