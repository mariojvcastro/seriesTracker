require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  def login_as(user)
   @request.session[:user_id] = user.id ? user.id : nil
  end
 
    
  setup do
    @message = messages(:one)
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

  test "should create message" do
    user = users(:one)
    login_as(user)
    assert_difference('Message.count') do
      post :create, message: @message.attributes
    end

    assert_redirected_to message_path(assigns(:message))
  end

  test "should show message" do
    user = users(:one)
    login_as(user)
    get :show, id: @message.to_param
    assert_response :success
  end

  test "should get edit" do
    user = users(:one)
    login_as(user)
    get :edit, id: @message.to_param
    assert_response :success
  end

  test "should update message" do
    user = users(:one)
    login_as(user)
    put :update, id: @message.to_param, message: @message.attributes
    assert_redirected_to message_path(assigns(:message))
  end

  test "should destroy message" do
        user = users(:one)
    login_as(user)
    assert_difference('Message.count', -1) do
      delete :destroy, id: @message.to_param
    end

    assert_redirected_to messages_path
  end
end
