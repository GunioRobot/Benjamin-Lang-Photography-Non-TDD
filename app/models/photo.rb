class Photo < ActiveRecord::Base
  belongs_to :project
  validates :img_url, :presence => true
  validates :display_order, :presence => true
  validates :project_id, :presence => true
end
