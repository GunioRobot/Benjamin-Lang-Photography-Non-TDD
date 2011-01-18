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
  test "should display the photo in a corresponding div" do
  	photo = photos(:photo_one)
    get(:show, {:id => photo.id})
    assert_select 'div.photo_container' do
    	assert_select 'img.photo' do
    		assert_select '[src=?]', photo.img_url
    		assert_select '[width=500]'
    	end
    end
  end
 
  # Conditional view functional tests
  test "should display the photo's title in a span if the title exists" do
  	photo = photos(:photo_one)
    get(:show, {:id => photo.id})
    assert_select 'div.photo_container' do
    	assert_select 'span#photo_title', :text => photo.title
    end
  end
  test "should NOT display a title if the photo doesn't have a title" do
  	photo = photos(:photo_no_title)
    get(:show, {:id => photo.id})
    assert_select 'div.photo_container' do
    	assert_select 'span#photo_title', false
    end
  end
  test "should display the photo numbers div if the Photo's Project has more than one photo" do
  	photo = photos(:photo_one)
    get(:show, {:id => photo.id})
    assert_not_equal photo.project.photos.length, 1
    assert_select 'div#photo_numbers_div' do
    	assert_select 'span#current_photo_number[class=photo_numbers]', :text => photo.project.display_photos.index(photo)+1
    	assert_select 'span#total_photo_number[class=photo_numbers]', :text => photo.project.photos.length
    end
  end
  test "should NOT display the photo numbers div if the Photo's Project has only photo" do
  	photo = photos(:photo_solo)
    get(:show, {:id => photo.id})
    assert_equal photo.project.photos.length, 1
    assert_select 'div#photo_numbers_div', false
  end
  test "should display a link to the previous photo if the Photo is not the first photo in the project" do
  	photo = photos(:photo_three)
    get(:show, {:id => photo.id})
    assert_not_nil photo.prev_photo
    assert_select 'a.prev_next_a', :text => 'prev' do
    	assert_select '[href=?]', project_photo_path(photo.project,photo.prev_photo)
    end
  end
  test "should NOT display a link to the previous photo if the Photo is the first photo in the project" do
  	photo = photos(:photo_one)
    get(:show, {:id => photo.id})
    assert_nil photo.prev_photo
    assert_select 'a.prev_next_a', {:text => 'prev', :count => 0}
  end
  test "should display a link to the next photo if the Photo is not the last photo in the project" do
  	photo = photos(:photo_one)
    get(:show, {:id => photo.id})
    assert_not_nil photo.next_photo
    assert_select 'a.prev_next_a', :text => 'next' do
    	assert_select '[href=?]', project_photo_path(photo.project,photo.next_photo)
    end
  end
  test "should NOT display a link to the next photo if the Photo is the last photo in the project" do
  	photo = photos(:photo_solo)
    get(:show, {:id => photo.id})
    assert_nil photo.next_photo
    assert_select 'a.prev_next_a', {:text => 'next', :count => 0}
  end
  
end
