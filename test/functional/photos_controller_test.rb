require 'test_helper'

class PhotosControllerTest < ActionController::TestCase
  test "should get show" do
  	photo = photos(:photo_one)
    get(:show, {:id => photo.id})
    assert_response :success
  end
  test "should display links to this Photo's Project's ProjectType's Projects in the side navigation" do
  	photo = photos(:photo_one)
    get(:show, {:id => photo.id})
  	assert_select 'ul#side_nav_list' do
  		assert_select 'li' do
  			assert_select 'a.nav_a'
  		end
  	end
  end
  test "should select this Photo's Project name in the side_nav" do
  	photo = photos(:photo_one)
    get(:show, {:id => photo.id})
  	assert_select 'ul#side_nav_list' do
  		assert_select 'li' do
  			assert_select 'a.nav_a.selected_a', {:count => 1, :text => photo.project.name}
  		end
  	end
  end
end
