require "test_helper"

class AnswerTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    answer = Answer.new(
      body: "dcdd",
      question_id: 1,
      user_id: 1
    )

    assert answer.valid?
  end

  test "should be valid with incorrect body" do
    answer = Answer.new(
      body: "d",
      question_id: 1,
      user_id: 1
    )

    assert_not answer.valid?
    assert_not_nil answer.errors
  end

  test "should not be valid without a body" do
    answer = Answer.new(
      question_id: 1,
      user_id: 1
    )

    assert_not answer.valid?
    assert_not_nil answer.errors
  end

  test "should not be valid without a question_id" do
    answer = Answer.new(
      body: "d",
      user_id: 1
    )

    assert_not answer.valid?
    assert_not_nil answer.errors
  end

  test "should not be valid without a user_id" do
    answer = Answer.new(
      body: "d",
      question_id: 1,
    )

    assert_not answer.valid?
    assert_not_nil answer.errors
  end
end
