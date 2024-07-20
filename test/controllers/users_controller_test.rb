require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    # session[:user] = 1
    # session[:id] = @user.id
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post :create, params: { user: { email: "John@gmail.com", 
                                      name: "John",
                                      password_digest: "password123" } }
    end

    assert_redirected_to root_path
  end

  test 'should not create user with invalid params' do
    assert_no_difference('User.count') do
      post :create, params: { user: { name: nil } }
    end

    assert_redirected_to new_user_path
    assert_not_nil flash[:alert]
  end

  test 'should show user' do
    get :show, params: { id: @user.id }
    assert_response :success
    assert_not_nil assigns(:user)
    assert_not_nil assigns(:posts)
  end

  test 'should authenticate user' do
    session[:user] = nil
    get :new
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @user.id }
    assert_response :success
    assert_not_nil assigns(:user)
  end

  test 'should not update user with invalid params' do
    patch :update, params: { id: @user.id, user: { name: nil } }
    assert_template :edit
    assert_not_nil :alert
  end
end
