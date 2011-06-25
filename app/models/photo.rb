class Photo < ActiveRecord::Base
  belongs_to :project
  validates :img_url, :presence => true
  validates :display_order, :presence => true
  validates :project_id, :presence => true
  validates :thumb_url, :presence => true
  
  def prev_photo
  	if self.eql?(self.project.display_photos.first)
  		return nil
  	else
  		prev_index = self.project.display_photos.index(self)-1
  		return self.project.display_photos.at(prev_index)
  	end
  end
  
  def next_photo
  	if self.eql?(self.project.display_photos.last)
  		return nil
  	else
  		next_index = self.project.display_photos.index(self)+1
  		return self.project.display_photos.at(next_index)
  	end
  end
  
end
