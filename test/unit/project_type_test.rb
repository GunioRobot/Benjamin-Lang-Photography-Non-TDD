require 'test_helper'

class ProjectTypeTest < ActiveSupport::TestCase
  # Tests regarding existing ProjectType entries

  test "First ProjectType has a name" do
    assert_not_nil ProjectType.first.name
  end
  test "First ProjectType has_many Projects" do
  	assert ProjectType.first.respond_to?(:projects)
  end
  test "First ProjectType has a display_order" do
    assert_not_nil ProjectType.first.display_order
  end

	# Tests regarding adding new ProjectType entries

  test "Adding a ProjectType without a name should fail" do
  	newType = ProjectType.create(:name => nil, :display_order => ProjectType.find(:first, :order => 'display_order DESC').display_order+1)
  	assert !newType.errors[:name].empty?
  end
  test "Adding a ProjectType with the exact name of an existing ProjectType should fail" do
  	cloneType = ProjectType.create(:name => 'film', :display_order => ProjectType.find(:first, :order => 'display_order DESC').display_order+1)
  	assert !cloneType.errors[:name].empty?
  end
   test "Adding a ProjectType with the same name (but different case) of an existing ProjectType should fail" do
  	cloneType = ProjectType.create(:name => 'Film', :display_order => ProjectType.find(:first, :order => 'display_order DESC').display_order+1)
  	assert !cloneType.errors[:name].empty?
  end
  test "Adding a ProjectType without a display_order should fail" do
  	newType = ProjectType.create(:name => 'new name', :display_order => nil)
  	assert !newType.errors[:display_order].empty?
  end

  # Tests regarding full_projects method

  test "All resulting projects should have no empty projects" do
  	proj_type = project_types(:film)
  	assert !proj_type.full_projects.empty?
  	proj_type.full_projects.each do |proj|
  		assert !proj.photos.empty?
  	end
  end

end