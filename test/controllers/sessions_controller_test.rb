require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create session for user' do
    post :new, params: { session: { email: users(:one).email, password: 'password' } }
    assert_response :success
  end
end
