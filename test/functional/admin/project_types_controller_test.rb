require 'test_helper'

class Admin::ProjectTypesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
