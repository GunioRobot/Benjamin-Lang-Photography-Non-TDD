class Project < ActiveRecord::Base
	belongs_to :project_type
	has_many :photos
	validates :name, :presence => true
	validates :project_type_id, :presence => true
	validates :display_order, :presence => true
	
	def display_photos
		return self.photos.order('display_order')
	end
	
end
