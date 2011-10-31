require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # Tests regarding existing Photo entries

  test "First Photo belongs_to a Project" do
  	assert_not_nil Photo.first.project_id
  end
  test "First Photo has a display_order" do
    assert_not_nil Photo.first.display_order
  end
  test "First Photo has an img_url" do
  	assert_not_nil Photo.first.img_url
  end
  test "First Photo has a thumb_url" do
  	assert_not_nil Photo.first.thumb_url
  end

  # Tests regarding adding new Photo entries

  test "Adding a new Photo without a title should NOT fail" do
  	proj_one = projects(:proj_one)
  	next_display_order = Photo.find(:first, :order => 'display_order DESC').display_order+1
  	new = Photo.create(:title => nil, :img_url => '/photos/new/testurl.jpg', :display_order => next_display_order, :project => proj_one, :thumb_url => '/photos/new/thumb_url.jpg')
  	assert new.errors[:title].empty?
  end
  test "Adding a new Photo without a display_order should fail" do
  	proj_one = projects(:proj_one)
  	new = Photo.create(:title => 'newPhotoTitle', :img_url => '/photos/new/testurl.jpg', :display_order => nil, :project => proj_one, :thumb_url => '/photos/new/thumb_url.jpg')
  	assert !new.errors[:display_order].empty?
  end
  test "Adding a new Photo without a Project should fail" do
  	next_display_order = Photo.find(:first, :order => 'display_order DESC').display_order+1
  	new = Photo.create(:title => 'newPhotoTitle', :img_url => '/photos/new/testurl.jpg', :display_order => next_display_order, :project => nil, :thumb_url => '/photos/new/thumb_url.jpg')
  	assert !new.errors[:project_id].empty?
  end
  test "Adding a new Photo without an img_url should fail" do
  	proj_one = projects(:proj_one)
  	next_display_order = Photo.find(:first, :order => 'display_order DESC').display_order+1
  	new = Photo.create(:title => 'newPhotoTitle', :img_url => nil, :display_order => next_display_order, :project => proj_one, :thumb_url => '/photos/new/thumb_url.jpg')
  	assert !new.errors[:img_url].empty?
  end
  test "Adding a new Photo without an thumb_url should fail" do
  	proj_one = projects(:proj_one)
  	next_display_order = Photo.find(:first, :order => 'display_order DESC').display_order+1
  	new = Photo.create(:title => 'newPhotoTitle', :img_url => '/photos/new/testurl.jpg', :display_order => next_display_order, :project => proj_one, :thumb_url => nil)
  	assert !new.errors[:thumb_url].empty?
  end

  # Tests regarding prev_photo method

  test "returns nil if a photo's previous photo does not exist" do
  	photo = photos(:photo_one)
  	assert_nil photo.prev_photo
  end
  test "returns the previous photo if a previous photo exists" do
  	photo = photos(:photo_three)
  	assert_equal photo.prev_photo, photos(:photo_one)
  end

  # Tests regarding next_photo method

  test "returns nil if a photo's next photo does not exist" do
  	photo = photos(:photo_solo)
  	assert_nil photo.next_photo
  end
  test "returns the next photo if a next photo exists" do
  	photo = photos(:photo_one)
  	assert_equal photo.next_photo, photos(:photo_three)
  end


end
