require 'test_helper'

class FavoritesControllerTest < ActionController::TestCase
def login_as(user)
   @request.session[:user_id] = user.id ? user.id : nil
  end
 
    
  setup do
    @favorite = favorites(:one)
  end

  test "should get index" do
    user = users(:one)
    login_as(user)
    get :index
    assert_response :success, @response.body
  end

   test "should not get index" do
    user = users(:one)
    get :index
    assert_response :redirect, @response.body
  end
  
  test "should create favorite" do
    user = users(:one)
    login_as(user)
    @favorite.user_id = user.id
    @serie = Series.new
    @favorite.series_id = @serie.id
    assert_difference('Favorite.count') do
      post :create, message: @favorite.attributes
    end
  end

  test "should destroy favorite" do
    user = users(:one)
    login_as(user)
    @favorite.user_id = user.id    
    assert_difference('Favorite.count', -1) do
      delete :destroy, id: @favorite.id
    end
  end
  
end
