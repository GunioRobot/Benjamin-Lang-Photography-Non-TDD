require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
	pt_film_id = Fixtures.identify(:film)
  test "First entry has a name" do
  	first = Project.first
    assert_not_nil first.name
  end
  test "Adding a new Project without a name should fail" do
  	new = Project.create(:name => nil, :project_type => ProjectType.find(pt_film_id))
  	assert !new.errors[:name].empty?
  end
  test "First entry has a project type" do
  	first = Project.first
  	assert_not_nil first.project_type_id
  end
  test "Adding a new Project without a project_type should fail" do
  	new = Project.create(:name => "Project Name", :project_type => nil)
  	assert !new.errors[:project_type_id].empty?
  	assert_nil new.project_type
  end
end
