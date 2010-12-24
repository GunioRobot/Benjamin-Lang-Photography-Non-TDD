require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test "should get show" do
  	proj = projects(:proj_one)
    get(:show, {:id => proj.id})
    assert_redirected_to project_photo_path(proj,proj.photos.find(:first,:order => 'display_order'))
    assert_response :redirect
  end
  
end
