require 'test_helper'

class PhotosControllerTest < ActionController::TestCase
  test "should get show" do
  	photo = photos(:photo_one)
    get(:show, {:id => photo.id})
    assert_response :success
  end

end
