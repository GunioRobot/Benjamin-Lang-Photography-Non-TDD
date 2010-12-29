require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # Tests regarding existing Photo entries
  
  test "First Photo has a title" do
    assert_not_nil Photo.first.title
  end
  test "First Photo belongs_to a Project" do
  	assert_not_nil Photo.first.project_id
  end
  test "First Photo has a display_order" do
    assert_not_nil Photo.first.display_order
  end
  
  # Tests regarding adding new Photo entries
  
  test "Adding a new Photo without a title should NOT fail" do
  	proj_one = projects(:proj_one)
  	next_display_order = Photo.find(:first, :order => 'display_order DESC').display_order+1
  	new = Photo.create(:title => nil, :img_url => '/photos/new/testurl.jpg', :display_order => next_display_order, :project => proj_one)
  	assert new.errors[:title].empty?
  end
  test "Adding a new Photo without a display_order should fail" do
  	proj_one = projects(:proj_one)
  	new = Photo.create(:title => 'newPhotoTitle', :img_url => '/photos/new/testurl.jpg', :display_order => nil, :project => proj_one)
  	assert !new.errors[:display_order].empty?
  end
  test "Adding a new Photo without a Project should fail" do
  	next_display_order = Photo.find(:first, :order => 'display_order DESC').display_order+1
  	new = Photo.create(:title => 'newPhotoTitle', :img_url => '/photos/new/testurl.jpg', :display_order => next_display_order, :project => nil)
  	assert !new.errors[:project_id].empty?
  end
  test "Adding a new Photo without an img_url should fail" do
  	proj_one = projects(:proj_one)
  	next_display_order = Photo.find(:first, :order => 'display_order DESC').display_order+1
  	new = Photo.create(:title => 'newPhotoTitle', :img_url => nil, :display_order => next_display_order, :project => proj_one)
  	assert !new.errors[:img_url].empty?
  end
end
