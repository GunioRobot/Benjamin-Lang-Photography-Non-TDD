class ProjectType < ActiveRecord::Base
	validates :name, :presence => true
end
