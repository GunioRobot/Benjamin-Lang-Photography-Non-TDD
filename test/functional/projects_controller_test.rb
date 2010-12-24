require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test "should redirect to the show action of the first Photo for the Project" do
  	proj = projects(:proj_one)
    get(:show, {:id => proj.id})
    assert_redirected_to project_photo_path(proj,proj.photos.find(:first,:order => 'display_order'))
    assert_response :redirect
  end
  test "should NOT redirect to the show action of the first Photo if the Project is empty" do
  	proj = projects(:empty_proj)
  	get(:show, {:id => proj.id})
  	assert_response :success
  end
  
end
