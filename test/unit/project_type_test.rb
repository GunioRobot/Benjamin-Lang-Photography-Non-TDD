require 'test_helper'

class ProjectTypeTest < ActiveSupport::TestCase
  # Tests regarding existing ProjectType entries
  
  test "First ProjectType has a name" do
    one = ProjectType.first
    assert_not_nil one.name
  end
  test "First ProjectType has Projects" do
  	assert ProjectType.first.respond_to?(:projects)
  end
  
	# Tests regarding adding new ProjectType entries
	
  test "Adding a ProjectType without a name should fail" do
  	newType = ProjectType.create(:name => nil)
  	assert !newType.errors[:name].empty?
  end
  test "Adding a ProjectType with the exact name of an existing ProjectType should fail" do
  	cloneType = ProjectType.create(:name => 'film')
  	assert !cloneType.errors[:name].empty?
  end
   test "Adding a ProjectType with the same name (but different case) of an existing ProjectType should fail" do
  	cloneType = ProjectType.create(:name => 'Film')
  	assert !cloneType.errors[:name].empty?
  end
end