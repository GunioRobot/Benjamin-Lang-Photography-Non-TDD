require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
	# Tests regarding existing Project entries

  test "First Project has a name" do
    assert_not_nil Project.first.name
  end
  test "First Project belongs_to a ProjectType" do
  	assert_not_nil Project.first.project_type_id
  end
  test "First Project has_many Photos" do
  	assert Project.first.respond_to?(:photos)
  end
  test "First Project has a display_order" do
    assert_not_nil Project.first.display_order
  end

	# Tests regarding adding new Project entries

  test "Adding a new Project without a name should fail" do
  	pt_film = project_types(:film)
  	new = Project.create(:name => nil, :project_type => pt_film, :display_order => Project.find(:first, :order => 'display_order DESC').display_order+1)
  	assert !new.errors[:name].empty?
  end
  test "Adding a new Project without a project_type should fail" do
  	new = Project.create(:name => "Project Name", :project_type => nil, :display_order => Project.find(:first, :order => 'display_order DESC').display_order+1)
  	assert !new.errors[:project_type_id].empty?
  end
  test "Adding a new Project without a display_order should fail" do
  	pt_film = project_types(:film)
  	new = Project.create(:name => "Project Name", :project_type => pt_film, :display_order => nil)
  	assert !new.errors[:display_order].empty?
  end

  # Tests regarding display_photos method

  test "returns the photos in a project in ordered by increasing display order" do
  	proj = projects(:proj_two)
  	test_array_of_photos = [photos(:photo_two),photos(:photo_five),photos(:photo_no_title),photos(:photo_four)]
  	proj.display_photos.each_with_index do |photo, index|
  		assert_equal photo, test_array_of_photos[index]
  	end
  end

end