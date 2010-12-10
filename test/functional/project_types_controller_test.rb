require 'test_helper'

class ProjectTypesControllerTest < ActionController::TestCase
  test "should get show" do
    get(:show, {'name' => 'film'})
    assert_response :success
  end
  test "should grab the correct ProjectType from name param" do
  	get(:show, {'name' => 'film'})
  	assert_select 'ul#side_nav_list' do
  		assert_select 'li' do
  			assert_select 'a.nav_a'
  		end
  	end
  end
  test "should display links to the ProjectType's Projects in the side navigation" do
  	assert true
  end
end
