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
  test "should display links to this Project's ProjectType's Projects in the side navigation" do
  	proj = projects(:empty_proj)
    get(:show, {:id => proj.id})
  	assert_select 'ul#side_nav_list' do
  		assert_select 'li' do
  			assert_select 'a.nav_a'
  		end
  	end
  end
  test "should select the Project name in the side_nav" do
  	proj = projects(:empty_proj)
    get(:show, {:id => proj.id})
  	assert_select 'ul#side_nav_list' do
  		assert_select 'li' do
  			assert_select 'a.nav_a.selected_a', {:count => 1, :text => proj.name}
  		end
  	end
  end
end