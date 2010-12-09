require 'test_helper'

class ProjectTypeTest < ActiveSupport::TestCase
  test "First entry has a name" do
    one = ProjectType.first
    assert one.name
  end
  test "Attempt to save a Project type without a name" do
  	newType = ProjectType.create(:name => nil)
  	assert !newType.errors[:name].empty?
  end
end
