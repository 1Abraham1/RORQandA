require "test_helper"

class QuestionsControllerTest < ActionDispatch::IntegrationTest

  # test "should create question" do
  #   assert_difference("Question.count", 0) do
  #     post questions_url, params: { question: { body: "Rails is awesome!", title: "Hello Rails" } }
  #   end
  
  #   assert_redirected_to question_path(Question.last)
  #   assert_equal "Article was successfully created.", flash[:notice]
  # end
  test "should get index" do
    get questions_index_url
    assert_response :success
  end

  test "should show question" do
    question = questions(:one)
    get question_path(question)
    assert_response :success
  end

  test "should destroy question" do
    question = questions(:one)
    assert_difference("Question.count", -1) do
      delete question_path(question)
    end
  
    assert_redirected_to questions_path
  end

  test 'should destroy question1' do
    assert_difference('Question.count', -1) do
      delete :destroy, params: { id: questions(:one).id }
    end

  end

  test 'should get edit' do
    get :edit, params: { id: questions(:one).id }
    assert_response :success
    assert_not_nil assigns(:question)
  end

  test "should update question" do
    question = questions(:one)
  
    patch question_url(question), params: { question: { title: "updated" } }
  
    assert_redirected_to question_path(question)

    question.reload
    assert_equal "updated", question.title
  end
  
end
