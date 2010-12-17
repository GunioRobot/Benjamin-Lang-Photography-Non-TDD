require 'test_helper'

class ProjectTypesControllerTest < ActionController::TestCase
  pt_film_id = Fixtures.identify(:film)
  test "should get show" do
    get(:show, {'name' => 'film'})
    assert_response :success
  end
  test "should display the correct ProjectType from name param" do
  	get(:show, {'name' => 'film'})
  	assert_select 'ul#side_nav_list' do |elements|
  			assert_select elements.first, 'li' do
  				assert_select 'a.nav_a', ProjectType.find(pt_film_id).projects.order('display_order').first.name
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
