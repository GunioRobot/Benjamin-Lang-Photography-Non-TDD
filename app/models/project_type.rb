class ProjectType < ActiveRecord::Base
	has_many :projects
	validates :name, :presence => true
	validates_uniqueness_of :name, :case_sensitive => false
	validates :display_order, :presence => true

	def full_projects
		full_projs = self.projects.order('display_order').reject do |proj|
			proj.photos.empty?
		end
		return full_projs
	end

end
