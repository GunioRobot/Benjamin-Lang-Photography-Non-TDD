require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  proj_one_id = Fixtures.identify(:proj_one)
  test "should get show" do
    get(:show, {:id => proj_one_id})
    assert_response :success
  end
end
