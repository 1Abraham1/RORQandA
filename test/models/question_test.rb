require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  test "should be valid with all attributes" do
    question = Question.new(
      title: "Example title",
      body: "Example body",
      user_id: 1
    )
    assert question.valid?
  end

  test "should not be valid without a user_id" do
    question = Question.new(
      title: "Example title",
      body: "Example body",
    )
    assert_not question.valid?
    assert_not_nil question.errors
  end

  test "should not be valid without a title" do
    question = Question.new(
      body: "Example body",
      user_id: 1
    )
    assert_not question.valid?
    assert_not_nil question.errors
  end

  test "should not be valid without a body" do
    question = Question.new(
      title: "Example title",
      user_id: 1
    )
    assert_not question.valid?
    assert_not_nil question.errors
  end
end
