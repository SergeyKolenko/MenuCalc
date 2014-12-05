require 'test_helper'

class ScaffoldControllerTest < ActionController::TestCase
  test "should get foods" do
    get :foods
    assert_response :success
  end

end
