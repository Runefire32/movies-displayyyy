require 'test_helper'

class MovieControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get movie_search_url
    assert_response :success
  end

end
