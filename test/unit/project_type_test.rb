require 'test_helper'

class ProjectTypeTest < ActiveSupport::TestCase
  test "First entry has a name" do
    one = ProjectType.first
    assert_not_nil one.name
  end
  test "Adding a Project Type without a name should fail" do
  	newType = ProjectType.create(:name => nil)
  	assert !newType.errors[:name].empty?
  end
end
