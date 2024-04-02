require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should save valid user" do
    user = User.new(email: "test@example.com", password: "password")
    assert user.save, "Could not save a valid user"
  end

  test "should not save user without an email" do
    user = User.new(password: "password")
    assert_not user.save, "Saved the user without an email"
  end

  test "should not save user without a password" do
    user = User.new(email: "test@example.com")
    assert_not user.save, "Saved the user without a password"
  end

  test "should save user with a valid email format" do
    user = User.new(email: "test@example.com", password: "password")
    assert user.valid?, "Could not save the user with a valid email format"
  end

  test "should not save user with an invalid email format" do
    user = User.new(email: "invalid_email", password: "password")
    assert_not user.valid?, "Saved the user with an invalid email format"
  end

  test "should have many shared movies" do
    user = users(:one)
    assert_not user.shared_movies.empty?, "User does not have any shared movies"
  end

  test "should have many reactions" do
    user = users(:one)
    assert_not user.reactions.empty?, "User does not have any reactions"
  end

  test "should have many notifications" do
    user = users(:one)
    assert_not user.notifications.empty?, "User does not have any notifications"
  end
end
