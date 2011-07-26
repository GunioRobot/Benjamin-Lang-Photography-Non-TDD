class Admin::ProjectTypesController < ApplicationController
  def show
  	@type = ProjectType.find_by_name(params[:name])
  	@projs = @type.projects
  end

end