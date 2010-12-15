class Project < ActiveRecord::Base
	belongs_to :project_type
	validates :name, :presence => true
	validates :project_type_id, :presence => true
	validates :display_order, :presence => true
end
