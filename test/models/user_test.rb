require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    user = User.new(
      email: "John@gmail.com",
      name: "John",
      password_digest: "password123"
    )

    assert user.valid?
  end

  test "should be valid with incorrect email" do
    user = User.new(
      email: "Johngmail.com",
      name: "John",
      password_digest: "password123"
    )

    assert_not user.valid?
    assert_not_nil user.errors
  end

  test "should not be valid without a email" do
    user = User.new(
      name: "John",
      password_digest: "password123"
    )
    
    assert_not user.valid?
    assert_not_nil user.errors
  end

  test "should not be valid without a name" do
    user = User.new(
      email: "John@gmail.com",
      password_digest: "password123"
    )
    
    assert_not user.valid?
    assert_not_nil user.errors
  end

  test "should not be valid without a password_digest" do
    user = User.new(
      name: "John",
      email: "John@gmail.com"
    )
    
    assert_not user.valid?
    assert_not_nil user.errors
  end

end
