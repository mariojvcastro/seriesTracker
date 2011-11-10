require 'test_helper'

class EpisodesControllerTest < ActionController::TestCase
  test "should get name:string" do
    get :name:string
    assert_response :success
  end

  test "should get number:integer" do
    get :number:integer
    assert_response :success
  end

  test "should get season:references" do
    get :season:references
    assert_response :success
  end

  test "should get description:text" do
    get :description:text
    assert_response :success
  end

end
