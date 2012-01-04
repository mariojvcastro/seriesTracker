require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def login_as(user)
   @request.session[:user_id] = user.id ? user.id : nil
  end
 
    
  setup do
    @user = users(:one)
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
  
  test "should get new" do
    user = users(:one)
    login_as(user)
    get :new
    assert_response :success
  end

  test "should create user" do
    user2 = User.find(@user.id)
    assert_nil(user2)
    assert_difference('User.count') do
      post :create, message: @user.attributes
    end
  end

   test "should not create user" do
    user = users(:one)
    login_as(user)
    user2 = User.find(@user.id)
    assert_not_nil(user2)
  end


  test "should show user" do
    user = users(:one)
    login_as(user)
    get :show, id: @user.to_param
    assert_response :success
  end

  test "should get edit" do
    user = users(:one)
    login_as(user)
    get :edit, id: @user.to_param
    assert_response :success
  end

  test "should update user" do
    user = users(:one)
    login_as(user)
    put :update, id: @user.to_param, message: @user.attributes
  end

  test "should destroy user" do
    user = users(:one)
    login_as(user)
    assert_difference('User.count', -1) do
      delete :destroy, id: @user.to_param
    end
  end
end
