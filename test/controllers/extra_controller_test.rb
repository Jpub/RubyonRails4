require 'test_helper'

class ExtraControllerTest < ActionController::TestCase
  test "should get sendmail" do
    get :sendmail
    assert_response :success
  end

end
