require 'test_helper'

class EvntsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get evnts_search_url
    assert_response :success
  end

  test "should get event" do
    get evnts_event_url
    assert_response :success
  end

end
