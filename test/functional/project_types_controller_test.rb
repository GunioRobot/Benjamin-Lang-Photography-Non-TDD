require 'test_helper'

class ProjectTypesControllerTest < ActionController::TestCase
  test "should get show" do
    get(:show, {'name' => 'film'})
    assert_response :success
  end
  test "should display the correct ProjectType from name param" do
  	pt = project_types(:film)
  	get(:show, {'name' => 'film'})
  	assert_select 'ul#side_nav_list' do |elements|
  			assert_select elements.first, 'li' do
  				assert_select 'a.nav_a', pt.projects.order('display_order').first.name
  			end
  	end
  end
  test "should display links to the ProjectType's Projects in the side navigation" do
  	get(:show, {'name' => 'film'})
  	assert_select 'ul#side_nav_list' do
  		assert_select 'li' do
  			assert_select 'a.nav_a'
  		end
  	end
  end
end