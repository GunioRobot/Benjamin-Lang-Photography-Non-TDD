require 'test_helper'

class ProjectTypeTest < ActiveSupport::TestCase
  test "First ProjectType has a name" do
    one = ProjectType.first
    assert_not_nil one.name
  end
  test "Adding a ProjectType without a name should fail" do
  	newType = ProjectType.create(:name => nil)
  	assert !newType.errors[:name].empty?
  end
  test "First ProjectType has photos" do
  	#assert ProjectType.first.projects
  end
end