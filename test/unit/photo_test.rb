require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # Tests regarding existing Photo entries
  
  test "First Photo has a title" do
    assert_not_nil Photo.first.title
  end
  test "First Photo has a Project" do
  	assert_not_nil Photo.first.project_id
  end
  test "First Photo has a display_order" do
    assert_not_nil Photo.first.display_order
  end
  
end
