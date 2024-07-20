require "test_helper"

class BlogFlowTest < ActionDispatch::IntegrationTest
  test "can see the welcome page" do
    get "/"
    assert_select "h1", "Welcome to QandA!"
  end

  def log_in(email, password)
    get "/session/new"
    assert_response :success

    post "/session",
      params: {email: email, password: password}
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "can create a question" do

    log_in("akop2003@gmail.com", "Akop2003!")

    get "/questions/new"
    assert_response :success
  
    post "/questions",
      params: { question: { title: "can create", body: "question successfully." } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "div", "Question created!"
  end

  test "can delete a question" do

    log_in("akop2003@gmail.com", "Akop2003!")

    get "/questions/new"
    assert_response :success
  
    post "/questions",
      params: { question: { title: "can create", body: "question successfully." } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "div", "Question created!"
  end
end
